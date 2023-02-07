part of 'game_cubit.dart';

@freezed
class GameState with _$GameState {
  factory GameState({
    @Default([]) List<ConnectedUser> connectedUsers,
    RoundCubit? activeRound,
    @Default('') String gameId,
    @Default(GameStatus.initial()) GameStatus status,
  }) = _GameState;

  GameState._();
}

@freezed
class GameStatus with _$GameStatus {
  const factory GameStatus.initial() = _Initial;
  const factory GameStatus.loading(String message) = Loading;
  const factory GameStatus.gameCreated() = GameCreated;
  const factory GameStatus.gameJoined() = GameJoined;
  const factory GameStatus.updated() = Updated;
  const factory GameStatus.gameFinished() = GameFinished;
}
