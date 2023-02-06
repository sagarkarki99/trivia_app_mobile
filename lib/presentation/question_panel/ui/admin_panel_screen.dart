import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/data/socket_client.dart';
import 'package:trivia_app/presentation/connected_users/ui/connected_users_ui.dart';
import 'package:trivia_app/presentation/game_cubit/game_cubit.dart';
import 'package:trivia_app/presentation/question_panel/ui/finish_button.dart';

import '../../../di/locator.dart';
import '../../round/round_cubit.dart';
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
          BlocConsumer<GameCubit, GameState>(
            listener: ((context, state) {
              if (state.status is GameFinished) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Game finished.'),
                  ),
                );
                Navigator.of(context).popUntil((route) => route.isFirst);
              }
            }),
            builder: (context, state) {
              if (state.activeRound != null) {
                return BlocProvider.value(
                  value: state.activeRound!,
                  child: const QuestionView(),
                );
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
          const FinishButton(),
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
    return BlocBuilder<RoundCubit, RoundState>(
      builder: (context, state) {
        final question = state.questionPayload;
        final connectedUsers = context.read<GameCubit>().state.connectedUsers;
        return Column(
          children: [
            Text(
              question.question,
              style: Theme.of(context).textTheme.headline3,
            ),
            const SizedBox(height: 16),
            ...question.answerOptions.map((answer) {
              final answerCount = state.answers
                  .where((ans) => ans.userAnswer == answer)
                  .map((e) => e.getUserIn(connectedUsers))
                  .toList()
                  .length;
              return Row(
                children: [
                  Text(answer),
                  const SizedBox(width: 6),
                  Text(answerCount.toString())
                ],
              );
            }).toList(),
            const CountDownUi()
          ],
        );
      },
    );
  }
}

class CountDownUi extends StatelessWidget {
  const CountDownUi({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoundCubit, RoundState>(
      builder: (context, state) {
        return Text(
            'Remaining: ${(state.remainingMilliseconds / 1000).toStringAsFixed(2)}');
      },
    );
  }
}
