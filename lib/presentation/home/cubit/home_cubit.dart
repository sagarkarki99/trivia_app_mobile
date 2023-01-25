import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/socket_client.dart';
import '../../../models/game_state.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  SocketClient socketClient;
  HomeCubit({required this.socketClient}) : super(const HomeState.initial()) {
    socketClient.recieveOn(RecievingEvent.gameCreated, (id) {
      emit(HomeState.gameCreated(id as String));
    });

    socketClient.recieveOn(RecievingEvent.joined, (gameState) {
      final s = InitialGameState.fromJson(gameState as Map<String, dynamic>);
      emit(HomeState.gameJoined(s));
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
