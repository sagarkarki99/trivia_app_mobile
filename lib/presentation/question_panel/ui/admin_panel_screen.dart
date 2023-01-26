import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/data/socket_client.dart';
import 'package:trivia_app/presentation/connected_users/ui/connected_users_ui.dart';
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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<GameCubit, GameState>(
            builder: (context, state) {
              if (state.question != null) {
                return const QuestionView();
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
          ),
          const Text('Connected Users'),
          const Expanded(child: ConnectedUsersUi()),
        ],
      ),
    );
  }
}

class QuestionView extends StatelessWidget {
  const QuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        final question = state.question!;

        return Column(
          children: [
            Text(question.question,
                style: Theme.of(context).textTheme.headline3),
            const SizedBox(height: 16),
            ...question.answerOptions
                .map((e) => Row(
                      children: [
                        Text(e),
                        const SizedBox(width: 6),
                        Text(state.getUserCountFor(e).toString())
                      ],
                    ))
                .toList()
          ],
        );
      },
    );
  }
}
