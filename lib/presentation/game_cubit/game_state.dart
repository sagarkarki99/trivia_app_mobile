part of 'game_cubit.dart';

@freezed
class GameState with _$GameState {
  factory GameState({
    @Default([]) List<ConnectedUsers> connectedUsers,
    @Default(GameStatus.initial()) GameStatus status,
  }) = _GameState;
}

@freezed
class GameStatus with _$GameStatus {
  const factory GameStatus.initial() = _Initial;
  const factory GameStatus.updated() = _Updated;
}
