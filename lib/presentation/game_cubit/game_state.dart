part of 'game_cubit.dart';

@freezed
class GameState with _$GameState {
  factory GameState({
    @Default([]) List<ConnectedUser> connectedUsers,
    @Default([]) List<Answer> answers,
    @Default('') String gameId,
    @Default(GameStatus.initial()) GameStatus status,
    QuestionPayload? question,
  }) = _GameState;

  GameState._();

  int getUserCountFor(String answer) {
    return getUsersFor(answer).length;
  }

  List<ConnectedUser> getUsersFor(String answer) {
    return answers
        .where((ans) => ans.userAnswer == answer)
        .map((e) => e.getUserIn(connectedUsers))
        .toList();
  }
}

@freezed
class GameStatus with _$GameStatus {
  const factory GameStatus.initial() = _Initial;
  const factory GameStatus.gameCreated() = GameCreated;
  const factory GameStatus.gameJoined() = GameJoined;
  const factory GameStatus.updated() = Updated;
}
