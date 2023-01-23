class NewAnswer {
  String? userId;
  Answer? answer;

  NewAnswer({this.userId, this.answer});

  NewAnswer.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    answer = json['answer'] != null ? Answer.fromJson(json['answer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    if (answer != null) {
      data['answer'] = answer!.toJson();
    }
    return data;
  }
}

class Answer {
  String? correctAnswer;
  String? userAnswer;
  int? remainingSeconds;

  Answer({this.correctAnswer, this.userAnswer, this.remainingSeconds});

  Answer.fromJson(Map<String, dynamic> json) {
    correctAnswer = json['correctAnswer'];
    userAnswer = json['userAnswer'];
    remainingSeconds = json['remainingSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['correctAnswer'] = correctAnswer;
    data['userAnswer'] = userAnswer;
    data['remainingSeconds'] = remainingSeconds;
    return data;
  }
}
