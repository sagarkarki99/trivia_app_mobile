part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.gameCreated(String gameId) = GameCreated;
  const factory HomeState.gameJoined(InitialGameState gameState) = GameJoined;
}
