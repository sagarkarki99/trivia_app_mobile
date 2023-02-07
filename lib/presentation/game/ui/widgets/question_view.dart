import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/presentation/game/cubit/game_cubit.dart';
import 'package:trivia_app/presentation/game/round_cubit/round_cubit.dart';

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
