import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivia_app/data/socket_client.dart';
import '../../models/game_state.dart' as game_state;
import '../../models/game_state.dart';

part 'game_state.dart';
part 'game_cubit.freezed.dart';

class GameCubit extends Cubit<GameState> {
  SocketClient socketClient;
  GameCubit({required this.socketClient}) : super(GameState()) {
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
      final s =
          game_state.GameState.fromJson(gameState as Map<String, dynamic>);
      emit(state.copyWith(
          status: const GameStatus.gameJoined(),
          connectedUsers: s.connectedUsers!));
    });

    socketClient.recieveOn(RecievingEvent.newUserJoined, (data) {
      final user = ConnectedUsers.fromJson(data as Map<String, dynamic>);
      emit(state.copyWith(
        status: const GameStatus.updated(),
        connectedUsers: List.of(state.connectedUsers)..add(user),
      ));
    });
  }

  void joinGame() {
    socketClient.send(SendingEvent.joinGame, _getRandomUser().toJson());
  }

  void createGame() {
    socketClient.send(SendingEvent.createGame, _getRandomUser().toJson());
  }

  ConnectedUsers _getRandomUser() {
    return ConnectedUsers(
      id: 'id${Random().nextInt(100)}',
      name: 'User${Random().nextInt(100)}',
      imageUrl: 'asdf',
    );
  }
}
