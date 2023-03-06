import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/models/game_state.dart';
import 'package:trivia_app/models/question_payload.dart';
import 'package:trivia_app/presentation/game/cubit/game_cubit.dart';
import 'package:trivia_app/presentation/game/round_cubit/round_cubit.dart';
import 'package:trivia_app/presentation/ui_config/animations/fade_animation.dart';
import 'package:trivia_app/presentation/ui_config/animations/scale_animation.dart';
import 'package:trivia_app/presentation/ui_config/app_colors.dart';

import '../../../../data/socket_client.dart';
import '../../../../di/locator.dart';
import '../widgets/widgets.dart';

class PlaygroundScreen extends StatelessWidget {
  final InitialGameState initialState;
  const PlaygroundScreen({super.key, required this.initialState});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit(
        socketClient: locator<SocketClient>(),
        gameId: initialState.gameId!,
        connectedUsers: initialState.connectedUsers,
      ),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameState>(
      listener: ((context, state) {
        if (state.status is GameFinished) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Admin finished the game'),
            ),
          );
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
      }),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Play the game')),
          body: state.activeRound == null
              ? const ConnectedUsersUi()
              : BlocProvider.value(
                  value: state.activeRound!,
                  child: const AnsweringView(),
                ),
        );
      },
    );
  }
}

class AnsweringView extends StatelessWidget {
  const AnsweringView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<RoundCubit, RoundState>(
          builder: (context, state) {
            final question = state.questionPayload;
            return Material(
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: ScaleAnimation(
                        curve: Curves.fastOutSlowIn,
                        child: QuestionTitle(question: question.question),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Expanded(
                    flex: 4,
                    child: AnswersUI(),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          backgroundColor:
              context.watch<RoundCubit>().state.isTimerAboutToFinish
                  ? AppColors.light.red
                  : AppColors.light.primary,
          child: const CountDownUi(),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniStartFloat,
      ),
    );
  }
}

class QuestionTitle extends StatelessWidget {
  final String question;
  const QuestionTitle({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Text(
      question,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}

class AnswersUI extends StatefulWidget {
  const AnswersUI({
    super.key,
  });

  @override
  State<AnswersUI> createState() => _AnswersUIState();
}

class _AnswersUIState extends State<AnswersUI> {
  String selectedAnswer = '';
  @override
  Widget build(BuildContext context) {
    final roundState = context.watch<RoundCubit>().state;
    return Column(
      children: roundState.questionPayload.answerOptions.map((option) {
        if (roundState.isCorrectAnswer(option)) {
          return CorrectAnswerItem(answer: option);
        } else if (roundState.isWrongAnswer(option)) {
          return WrongAnswerItem(answer: option);
        } else {
          return FadeAnimation(
            durationMs: 500,
            child: AnswerItem(
              answer: option,
              isSelected: option == selectedAnswer,
              onSelect: roundState.allowToAnswer
                  ? () => setState(() => selectedAnswer = option)
                  : null,
              onSubmit: () {
                context.read<RoundCubit>().submitNewAnswer(selectedAnswer);
                setState(() => selectedAnswer = '');
              },
            ),
          );
        }
      }).toList(),
    );
  }
}

class DemoPlaygroundScreen extends StatelessWidget {
  const DemoPlaygroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoundCubit(
        gameId: 'hehe',
        client: locator<SocketClient>(),
        questionPayload: const QuestionPayload(
          question: 'What is the capital city of India?',
          answerOptions: ['Kathmandu', 'New Delhi', 'Berlin', "Beijing"],
          correctAnswer: 'New Delhi',
          totalSeconds: 20,
        ),
      ),
      child: const AnsweringView(),
    );
  }
}
