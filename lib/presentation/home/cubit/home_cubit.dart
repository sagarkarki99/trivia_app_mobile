import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivia_app/presentation/home/auth_cubit/auth_cubit.dart';

import '../../../data/socket_client.dart';
import '../../../models/game_state.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  SocketClient socketClient;
  AuthCubit authCubit;
  HomeCubit({required this.socketClient, required this.authCubit})
      : super(const HomeState.initial()) {
    socketClient.recieveOn(RecievingEvent.gameCreated, (id) {
      emit(HomeState.gameCreated(id as String));
    });

    socketClient.recieveOn(RecievingEvent.joined, (gameState) {
      final s = InitialGameState.fromJson(gameState as Map<String, dynamic>);
      emit(HomeState.gameJoined(s));
    });
  }

  void joinGame(String gameId) {
    emit(const HomeState.loading('Joining...'));
    socketClient.send(SendingEvent.joinGame, {
      "gameId": gameId,
      "user": authCubit.state.user?.toJson(),
    });
  }

  void createGame() {
    emit(const HomeState.loading('Creating new game...'));
    socketClient.send(SendingEvent.createGame, authCubit.state.user?.toJson());
  }
}
