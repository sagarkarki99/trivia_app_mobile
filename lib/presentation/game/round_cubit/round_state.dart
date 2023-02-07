part of 'round_cubit.dart';

@freezed
class RoundState with _$RoundState {
  const factory RoundState({
    @Default(RoundStatus.initial()) RoundStatus status,
    @Default([]) List<Answer> answers,
    required QuestionPayload questionPayload,
    required int remainingMilliseconds,
  }) = _RoundState;

  // int getUserCountFor(String answer) {
  //   return getUsersFor(answer).length;
  // }

  // List<ConnectedUser> getUsersFor(String answer) {
  //   return answers
  //       .where((ans) => ans.userAnswer == answer)
  //       .map((e) => e.getUserIn(connectedUsers))
  //       .toList();
  // }
}

@freezed
class RoundStatus with _$RoundStatus {
  const factory RoundStatus.initial() = _Initial;
  const factory RoundStatus.newAnswered() = _NewAnswered;
}
