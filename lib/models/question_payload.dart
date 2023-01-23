class QuestionPayload {
  String? question;
  List<String>? answerOptions;
  String? correctAnswer;
  int? totalSeconds;

  QuestionPayload(
      {this.question,
      this.answerOptions,
      this.correctAnswer,
      this.totalSeconds});

  QuestionPayload.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answerOptions = json['answerOptions'].cast<String>();
    correctAnswer = json['correctAnswer'];
    totalSeconds = json['totalSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answerOptions'] = answerOptions;
    data['correctAnswer'] = correctAnswer;
    data['totalSeconds'] = totalSeconds;
    return data;
  }
}
