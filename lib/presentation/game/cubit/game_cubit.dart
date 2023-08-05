import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivia_app/data/socket_client.dart';
import 'package:trivia_app/models/game_state.dart' as game_state;
import 'package:trivia_app/models/question_payload.dart';
import 'package:trivia_app/presentation/game/round_cubit/round_cubit.dart';
import 'package:trivia_app/presentation/game/ui/widgets/connected_users_ui.dart';
import 'package:trivia_app/presentation/ui_config/animations/scale_animation.dart';

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
    _listenGameStarted();

    _listenGameCreated();

    _listenJoined();

    _listenNewUserJoined();

    _listenUserLeft();

    _listenQuestionAsked();

    _listenGameFinished();

    _listenGameError();
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

  void startGame() {
    socketClient.send(SendingEvent.startGame, state.gameId);
  }

  void finishGame() {
    socketClient.send(SendingEvent.finishGame, state.gameId);
  }

  void _listenGameFinished() {
    socketClient.recieveOn(
      RecievingEvent.gameFinished,
      (message) {
        emit(state.copyWith(status: const GameStatus.gameFinished()));
      },
    );
  }

  void _listenQuestionAsked() {
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
  }

  void _listenUserLeft() {
    socketClient.recieveOn(RecievingEvent.userLeft, (data) {
      final userId = data['userId'] as String;
      final userLeft = state.connectedUsers.firstWhere(
        (user) => user.id == userId,
      );

      final index = state.connectedUsers.indexOf(userLeft);
      connectedUserListKey.currentState?.removeItem(
          index,
          ((context, animation) => ScaleAnimation(
                child: UserItem(name: userLeft.name),
              )));

      emit(
        state.copyWith(
          connectedUsers: List.of(state.connectedUsers)..remove(userLeft),
          status: GameStatus.userLeft('${userLeft.name} left the game.'),
        ),
      );
    });
  }

  void _listenNewUserJoined() {
    socketClient.recieveOn(RecievingEvent.newUserJoined, (data) {
      final user = ConnectedUser.fromJson(data as Map<String, dynamic>);
      connectedUserListKey.currentState
          ?.insertItem(state.connectedUsers.length);
      emit(state.copyWith(
        status: const GameStatus.gameJoined(),
        connectedUsers: List.of(state.connectedUsers)..add(user),
      ));
    });
  }

  void _listenJoined() {
    socketClient.recieveOn(RecievingEvent.joined, (gameState) {
      final s = game_state.InitialGameState.fromJson(
          gameState as Map<String, dynamic>);
      emit(state.copyWith(
          status: const GameStatus.gameJoined(),
          connectedUsers: s.connectedUsers!));
    });
  }

  void _listenGameCreated() {
    socketClient.recieveOn(RecievingEvent.gameCreated, (id) {
      emit(
        state.copyWith(
          status: const GameStatus.gameCreated(),
          connectedUsers: [],
          gameId: id as String,
        ),
      );
    });
  }

  void _listenGameStarted() {
    socketClient.recieveOn(RecievingEvent.gameStarted, (id) {
      emit(state.copyWith(status: const GameStatus.gameStarted()));
    });
  }

  void _listenGameError() {
    socketClient.recieveOn(RecievingEvent.error, (data) {
      log(data);
    });
  }
}
