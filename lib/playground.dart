import 'package:flutter/material.dart';
import 'package:socket_io_client/src/socket.dart';
import 'package:trivia_app/models/game_state.dart';
import 'package:trivia_app/models/question_payload.dart';

import 'models/answer_payload.dart';

class Playground extends StatefulWidget {
  late Socket socket;
  ConnectedUsers me;
  String gameId;
  List<ConnectedUsers> users;
  Playground(
      {super.key,
      required this.socket,
      required this.me,
      required this.users,
      required this.gameId});

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  QuestionPayload? questionPayload;
  List<NewAnswer> answers = [];

  @override
  void initState() {
    widget.socket.on('questionAsked', (data) {
      setState(() {
        questionPayload = QuestionPayload.fromJson(data);
      });
    });

    widget.socket.on('newAnswerSubmitted', (data) {
      final newAnswer = NewAnswer.fromJson(data);
      setState(() {
        answers = List.of(answers)..add(newAnswer);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('UserID: ${widget.me.id!}'),
        questionPayload == null
            ? const Text('Waiting for question !!')
            : ShowQuestion(
                questionPayload!,
                onAnswer: (option) => answer(option),
              )
      ],
    );
  }

  void answer(String option) {
    widget.socket.emit('answerQuestion', {
      "gameId": widget.gameId,
      "userId": widget.me.id,
      "answer": {
        "correctAnswer": questionPayload!.correctAnswer,
        "userAnswer": option,
        "remainingSeconds": 2,
      },
    });
  }
}

class ShowQuestion extends StatelessWidget {
  late QuestionPayload questionPayload;
  Function(String) onAnswer;
  ShowQuestion(this.questionPayload, {super.key, required this.onAnswer});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(questionPayload.question!),
        const SizedBox(height: 20),
        ...questionPayload.answerOptions!
            .map((option) => InkWell(
                  child: Text(option),
                  onTap: () => onAnswer(option),
                ))
            .toList()
      ],
    );
  }
}
