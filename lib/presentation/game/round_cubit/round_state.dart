part of 'round_cubit.dart';

@freezed
class RoundState with _$RoundState {
  const factory RoundState({
    @Default(RoundStatus.initial()) RoundStatus status,
    @Default([]) List<Answer> answers,
    @Default('') String selectedAnswer,
    required QuestionPayload questionPayload,
    required int remainingMilliseconds,
  }) = _RoundState;

  const RoundState._();

  bool isCorrectAnswer(String compareAnswer) =>
      selectedAnswer.isNotEmpty &&
      compareAnswer == questionPayload.correctAnswer;

  bool isWrongAnswer(String compareAnswer) =>
      selectedAnswer.isNotEmpty &&
      selectedAnswer == compareAnswer &&
      compareAnswer != questionPayload.correctAnswer;

  bool get allowToAnswer => !isTimeUp && selectedAnswer.isEmpty;
  double get remainingSeconds => remainingMilliseconds / 1000;

  bool get isTimerAboutToFinish => remainingSeconds <= 5.00;
  bool get isTimeUp => remainingSeconds == 0.00;
}

@freezed
class RoundStatus with _$RoundStatus {
  const factory RoundStatus.initial() = _Initial;
  const factory RoundStatus.newAnswerRecieved() = _NewAnswerRecieved;
  const factory RoundStatus.newAnswerSubmitted() = _NewAnswerSubmitted;
}
