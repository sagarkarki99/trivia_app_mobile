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

  bool get shouldBeInLobby =>
      status is GameInitial || status is GameJoined || status is UserLeft;
}

@freezed
class GameStatus with _$GameStatus {
  const factory GameStatus.initial() = GameInitial;
  const factory GameStatus.loading(String message) = Loading;
  const factory GameStatus.gameCreated() = GameCreated;
  const factory GameStatus.gameStarted() = GameStarted;
  const factory GameStatus.gameJoined() = GameJoined;
  const factory GameStatus.updated() = Updated;
  const factory GameStatus.userLeft(String message) = UserLeft;
  const factory GameStatus.gameFinished() = GameFinished;
}
