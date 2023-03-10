import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_payload.freezed.dart';
part 'question_payload.g.dart';

// class QuestionPayload {
//   String? question;
//   List<String>? answerOptions;
//   String? correctAnswer;
//   int? totalSeconds;

//   QuestionPayload(
//       {this.question,
//       this.answerOptions,
//       this.correctAnswer,
//       this.totalSeconds});

//   QuestionPayload.fromJson(Map<String, dynamic> json) {
//     question = json['question'];
//     answerOptions = json['answerOptions'].cast<String>();
//     correctAnswer = json['correctAnswer'];
//     totalSeconds = json['totalSeconds'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['question'] = question;
//     data['answerOptions'] = answerOptions;
//     data['correctAnswer'] = correctAnswer;
//     data['totalSeconds'] = totalSeconds;
//     return data;
//   }
// }

@Freezed()
class QuestionPayload with _$QuestionPayload {
  const factory QuestionPayload({
    required String question,
    required List<String> answerOptions,
    required String correctAnswer,
    required int totalSeconds,
  }) = _QuestionPayload;

  factory QuestionPayload.fromJson(Map<String, dynamic> json) =>
      _$QuestionPayloadFromJson(json);

  @override
  Map<String, dynamic> toJson() => {
        'question': question,
        'answerOptions': answerOptions,
        'correctAnswer': correctAnswer,
        'totalSeconds': totalSeconds
      };
}
