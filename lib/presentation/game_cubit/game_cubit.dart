import 'package:bloc/bloc.dart';
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
    socketClient.recieveOn(RecievingEvent.joined, (gameState) {
      final s =
          game_state.GameState.fromJson(gameState as Map<String, dynamic>);
      emit(state.copyWith(
          status: const GameStatus.updated(),
          connectedUsers: s.connectedUsers!));
    });
    socketClient.recieveOn(RecievingEvent.newUserJoined, (data) {
      final user = ConnectedUsers.fromJson(data as Map<String, dynamic>);
      emit(state.copyWith(
        connectedUsers: List.of(state.connectedUsers)..add(user),
      ));
    });
  }
}
