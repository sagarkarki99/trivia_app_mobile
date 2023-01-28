import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trivia_app/models/game_state.dart';

part 'answer.freezed.dart';
part 'answer.g.dart';

@freezed
class Answer with _$Answer {
  factory Answer({
    required String userId,
    required String userAnswer,
    required int timeTaken,
  }) = _Answer;

  Answer._();

  ConnectedUser getUserIn(List<ConnectedUser> users) {
    return users.firstWhere((user) => user.id == userId);
  }

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
}
