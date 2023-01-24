part of 'game_cubit.dart';

@freezed
class GameState with _$GameState {
  factory GameState({
    @Default([]) List<ConnectedUsers> connectedUsers,
    @Default('') String gameId,
    @Default(GameStatus.initial()) GameStatus status,
  }) = _GameState;
}

@freezed
class GameStatus with _$GameStatus {
  const factory GameStatus.initial() = _Initial;
  const factory GameStatus.gameCreated() = GameCreated;
  const factory GameStatus.gameJoined() = GameJoined;
  const factory GameStatus.updated() = Updated;
}
