import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/presentation/game/cubit/game_cubit.dart';
import 'package:trivia_app/presentation/game/round_cubit/round_cubit.dart';
import 'package:trivia_app/presentation/game/ui/screens/playground_screen.dart';
import 'package:trivia_app/presentation/game/ui/widgets/widgets.dart';
import 'package:trivia_app/presentation/ui_config/animations/scale_animation.dart';

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
            QuestionTitle(question: question.question),
            const SizedBox(height: 16),
            ...question.answerOptions.map((answer) {
              final answeredUsers = state.answers
                  .where((ans) => ans.userAnswer == answer)
                  .map((e) => e.getUserIn(connectedUsers))
                  .toList();
              return AnswerOptionUI(
                title: Text(answer),
                trailing: ScaleAnimation(
                    child: CloseUserAvatar(
                  users: answeredUsers,
                )),
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
        return Text(state.remainingSeconds.toStringAsFixed(2));
      },
    );
  }
}
