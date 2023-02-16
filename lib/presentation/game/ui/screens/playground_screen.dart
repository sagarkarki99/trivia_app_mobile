import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/models/game_state.dart';
import 'package:trivia_app/models/question_payload.dart';
import 'package:trivia_app/presentation/game/cubit/game_cubit.dart';
import 'package:trivia_app/presentation/game/round_cubit/round_cubit.dart';
import 'package:trivia_app/presentation/game/ui/widgets/connected_users_ui.dart';
import 'package:trivia_app/presentation/game/ui/widgets/question_view.dart';
import 'package:trivia_app/presentation/ui_config/animations/fade_animation.dart';
import 'package:trivia_app/presentation/ui_config/animations/scale_animation.dart';
import 'package:trivia_app/presentation/ui_config/app_colors.dart';
import 'package:trivia_app/presentation/ui_config/global_widgets/scale_tap_indicator.dart';

import '../../../../data/socket_client.dart';
import '../../../../di/locator.dart';

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

class AnswerItem extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback? onSelect;
  final VoidCallback? onSubmit;

  const AnswerItem({
    super.key,
    required this.answer,
    this.isSelected = false,
    required this.onSelect,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: ScaleTapDetector(
        onTap: onSelect,
        child: ListTile(
          title: Text(answer),
          visualDensity: VisualDensity.compact,
          dense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: isSelected
                  ? BorderSide(color: AppColors.light.grey)
                  : BorderSide.none),
          tileColor: isSelected
              ? AppColors.light.lightGreen.withOpacity(0.4)
              : AppColors.light.grey,
          trailing: isSelected
              ? ScaleAnimation(
                  child: IconButton(
                    icon: const Icon(
                      FluentIcons.send_16_filled,
                      color: Colors.green,
                    ),
                    onPressed: onSubmit,
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}

class CorrectAnswerItem extends StatelessWidget {
  final String answer;

  const CorrectAnswerItem({
    super.key,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      child: ListTile(
        visualDensity: VisualDensity.compact,
        dense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: AppColors.light.grey),
        ),
        minVerticalPadding: 14,
        trailing: Icon(
          FluentIcons.arrow_autofit_content_20_filled,
          color: Colors.green.withOpacity(0.8),
        ),
        tileColor: AppColors.light.lightGreen,
        title: Text(answer),
      ),
    );
  }
}

class WrongAnswerItem extends StatelessWidget {
  final String answer;

  const WrongAnswerItem({
    super.key,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      child: ListTile(
        visualDensity: VisualDensity.compact,
        dense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 8.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: AppColors.light.grey),
        ),
        minVerticalPadding: 14,
        trailing: Icon(FluentIcons.arrow_trending_checkmark_20_filled,
            color: AppColors.light.red.withOpacity(0.6)),
        tileColor: AppColors.light.red.withOpacity(0.3),
        title: Text(answer),
      ),
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
