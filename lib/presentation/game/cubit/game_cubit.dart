import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivia_app/data/socket_client.dart';
import 'package:trivia_app/models/game_state.dart' as game_state;
import 'package:trivia_app/models/question_payload.dart';
import 'package:trivia_app/presentation/game/round_cubit/round_cubit.dart';

import '../../../models/game_state.dart';

part 'game_state.dart';
part 'game_cubit.freezed.dart';

class GameCubit extends Cubit<GameState> {
  SocketClient socketClient;
  late GlobalKey<AnimatedListState> connectedUserListKey;
  GameCubit({
    required this.socketClient,
    required String gameId,
    List<ConnectedUser>? connectedUsers,
  }) : super(GameState(gameId: gameId, connectedUsers: connectedUsers ?? [])) {
    connectedUserListKey = GlobalKey<AnimatedListState>();
    _listenToEvents();
  }

  void _listenToEvents() {
    socketClient.recieveOn(RecievingEvent.gameCreated, (id) {
      emit(
        state.copyWith(
          status: const GameStatus.gameCreated(),
          connectedUsers: [],
          gameId: id as String,
        ),
      );
    });

    socketClient.recieveOn(RecievingEvent.joined, (gameState) {
      final s = game_state.InitialGameState.fromJson(
          gameState as Map<String, dynamic>);
      emit(state.copyWith(
          status: const GameStatus.gameJoined(),
          connectedUsers: s.connectedUsers!));
    });

    socketClient.recieveOn(RecievingEvent.newUserJoined, (data) {
      final user = ConnectedUser.fromJson(data as Map<String, dynamic>);
      connectedUserListKey.currentState?.insertItem(0);
      emit(state.copyWith(
        status: const GameStatus.updated(),
        connectedUsers: List.of(state.connectedUsers)..insert(0, user),
      ));
    });

    socketClient.recieveOn(RecievingEvent.questionAsked, (payload) {
      final questionPayload =
          QuestionPayload.fromJson(payload as Map<String, dynamic>);
      emit(
        state.copyWith(
          status: const GameStatus.updated(),
          activeRound: RoundCubit(
            client: socketClient,
            gameId: state.gameId,
            questionPayload: questionPayload,
          ),
        ),
      );
    });

    socketClient.recieveOn(
      RecievingEvent.gameFinished,
      (message) {
        emit(state.copyWith(status: const GameStatus.gameFinished()));
      },
    );
  }

  void askQuestion(QuestionPayload payload) {
    socketClient.send(
      SendingEvent.askQuestion,
      {
        "gameId": state.gameId,
        "questionPayload": payload,
      },
    );
    emit(state.copyWith(
      status: const GameStatus.updated(),
    ));
  }

  void finishGame() {
    socketClient.send(SendingEvent.finishGame, state.gameId);
  }
}
