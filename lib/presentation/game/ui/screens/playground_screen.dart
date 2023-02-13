import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/models/game_state.dart';
import 'package:trivia_app/presentation/game/cubit/game_cubit.dart';
import 'package:trivia_app/presentation/game/round_cubit/round_cubit.dart';
import 'package:trivia_app/presentation/game/ui/widgets/connected_users_ui.dart';
import 'package:trivia_app/presentation/game/ui/widgets/question_view.dart';
import 'package:trivia_app/presentation/ui_config/app_colors.dart';

import '../../../../data/socket_client.dart';
import '../../../../di/locator.dart';

class PlaygroundScreen extends StatelessWidget {
  final InitialGameState initialState;
  const PlaygroundScreen(this.initialState, {super.key});

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
    return Scaffold(
      body: BlocBuilder<RoundCubit, RoundState>(
        builder: (context, state) {
          final question = state.questionPayload;
          return Material(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child:
                      Center(child: QuestionTitle(question: question.question)),
                ),
                const SizedBox(height: 16),
                const Expanded(
                  flex: 2,
                  child: AnswersUI(),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: context.watch<RoundCubit>().state.isTimerAboutToFinish
            ? AppColors.light.red
            : AppColors.light.primary,
        child: const CountDownUi(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
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
      style: Theme.of(context).textTheme.headline3,
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
      children: roundState.questionPayload.answerOptions
          .map(
            (opt) => roundState.selectedAnswer ==
                    roundState.questionPayload.correctAnswer
                ? CorrectAnswerItem(answer: opt)
                : AnswerItem(
                    answer: opt,
                    isSelected: opt == selectedAnswer,
                    onSelect: roundState.isTimeUp
                        ? null
                        : () {
                            setState(() {
                              selectedAnswer = opt;
                            });
                          }),
          )
          .toList(),
    );
  }
}

class AnswerItem extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback? onSelect;

  const AnswerItem({
    super.key,
    required this.answer,
    this.isSelected = false,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8.0,
        ),
        minVerticalPadding: 14,
        visualDensity: VisualDensity.compact,
        dense: true,
        tileColor:
            isSelected ? AppColors.light.lightGreen : AppColors.light.grey,
        title: Text(answer),
        trailing: isSelected
            ? const Icon(
                FluentSystemIcons.ic_fluent_checkmark_circle_filled,
                color: Colors.green,
              )
            : const SizedBox(),
        onTap: onSelect,
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
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 8.0,
        ),
        minVerticalPadding: 14,
        visualDensity: VisualDensity.compact,
        dense: true,
        trailing: const Icon(FluentSystemIcons.ic_fluent_ticket_filled),
        tileColor: AppColors.light.grey,
        title: Text(answer),
      ),
    );
  }
}
