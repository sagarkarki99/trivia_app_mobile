import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/data/socket_client.dart';
import 'package:trivia_app/models/question_payload.dart';
import 'package:trivia_app/presentation/game_cubit/game_cubit.dart';

import '../../../di/locator.dart';
import '../question_form/question_form.dart';

class AdminPanelScreen extends StatelessWidget {
  final String gameId;
  const AdminPanelScreen({super.key, required this.gameId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GameCubit(socketClient: locator<SocketClient>(), gameId: gameId),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          BlocBuilder<GameCubit, GameState>(
            builder: (context, state) {
              if (state.question != null) {
                return QuestionView(state.question!);
              }
              return Text('GameId: ${context.read<GameCubit>().state.gameId}');
            },
          ),
          ElevatedButton(
            onPressed: () async {
              showModalBottomSheet(
                context: context,
                builder: (ctx) => QuestionForm(
                  onAsk: (question) {
                    context.read<GameCubit>().askQuestion(question);
                    Navigator.of(context).pop();
                  },
                ),
              );
            },
            child: const Text('Ask New Question'),
          )
        ],
      )),
    );
  }
}

class QuestionView extends StatelessWidget {
  final QuestionPayload question;
  const QuestionView(this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(question.question, style: Theme.of(context).textTheme.headline3),
        const SizedBox(height: 16),
        ...question.answerOptions.map((e) => Text(e)).toList()
      ],
    );
  }
}
