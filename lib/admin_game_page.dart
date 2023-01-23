import 'dart:math' as maths;

import 'package:flutter/material.dart';
import 'package:socket_io_client/src/socket.dart';
import 'package:trivia_app/connected_users_view.dart';

import 'models/answer_payload.dart';

class AdminGamePage extends StatefulWidget {
  Socket socket;
  AdminGamePage({super.key, required this.socket});

  @override
  State<AdminGamePage> createState() => _AdminGamePageState();
}

class _AdminGamePageState extends State<AdminGamePage> {
  TextEditingController? controller;
  String gameId = '';

  @override
  void initState() {
    controller = TextEditingController();
    widget.socket.on('gameCreated', (gmId) {
      setState(() {
        gameId = gmId;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          if (gameId.isEmpty) ..._buildNewGameForm(),
          if (gameId.isNotEmpty) Text('GameId: $gameId'),
          if (gameId.isNotEmpty)
            QuestionPlayground(
              gameId: gameId,
              socket: widget.socket,
            ),
          if (gameId.isNotEmpty) ConnectedUsersView(socket: widget.socket),
        ],
      ),
    );
  }

  List<Widget> _buildNewGameForm() {
    return [
      TextField(
        decoration: const InputDecoration(
          hintText: 'Name',
        ),
        controller: controller,
      ),
      MaterialButton(
        child: const Text('Create'),
        onPressed: () {
          final jsonData = {
            "id": 'id${maths.Random().nextInt(5000)}',
            "name": '${controller!.text}${maths.Random().nextInt(5000)}',
            "imageUrl": 'fsd'
          };
          widget.socket.emit('createGame', jsonData);
        },
      ),
    ];
  }
}

class QuestionPlayground extends StatefulWidget {
  final Socket socket;
  final String gameId;
  const QuestionPlayground(
      {super.key, required this.socket, required this.gameId});

  @override
  State<QuestionPlayground> createState() => _QuestionPlaygroundState();
}

class _QuestionPlaygroundState extends State<QuestionPlayground> {
  late TextEditingController questionController;
  late TextEditingController answer1Controller;
  late TextEditingController answer2Controller;
  late TextEditingController answer3Controller;
  late TextEditingController answer4Controller;

  List<NewAnswer> answers = [];

  @override
  void initState() {
    questionController = TextEditingController();
    answer1Controller = TextEditingController();
    answer2Controller = TextEditingController();
    answer3Controller = TextEditingController();
    answer4Controller = TextEditingController();

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
    return Form(
      child: Column(
        children: [
          TextFormField(
              controller: questionController,
              decoration: const InputDecoration(hintText: 'Question')),
          const SizedBox(height: 20),
          TextFormField(
              controller: answer1Controller,
              decoration: const InputDecoration(hintText: 'Answer 1')),
          TextFormField(
              controller: answer2Controller,
              decoration: const InputDecoration(hintText: 'Answer 2')),
          TextFormField(
              controller: answer3Controller,
              decoration: const InputDecoration(hintText: 'Answer 3')),
          TextFormField(
              controller: answer4Controller,
              decoration: const InputDecoration(hintText: 'Answer 4')),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () => _ask(), child: const Text('Send question')),
          const Text('Answers'),
          const SizedBox(height: 40),
          ...answers
              .map((answer) => ListTile(
                    title: Text(
                      answer.userId!,
                    ),
                    subtitle: Text(answer.answer!.userAnswer!),
                  ))
              .toList()
        ],
      ),
    );
  }

  void _ask() {
    final input = {
      "gameId": widget.gameId,
      "questionPayload": {
        "question": questionController.text,
        "answerOptions": [
          answer1Controller.text,
          answer2Controller.text,
          answer3Controller.text,
          answer4Controller.text,
        ],
        "correctAnswer": answer1Controller.text,
        "totalSeconds": 40
      }
    };
    widget.socket.emit('askQuestion', input);
  }
}
