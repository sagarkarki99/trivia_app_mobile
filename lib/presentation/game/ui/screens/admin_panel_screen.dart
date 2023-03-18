import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/data/socket_client.dart';
import 'package:trivia_app/presentation/game/cubit/game_cubit.dart';

import 'package:trivia_app/presentation/game/ui/widgets/finish_button.dart';
import 'package:trivia_app/presentation/game/ui/widgets/question_view.dart';
import 'package:trivia_app/presentation/home/lobby_screen.dart';
import 'package:trivia_app/presentation/question_form/question_form.dart';
import 'package:trivia_app/presentation/ui_config/animations/slide_animation.dart';

import '../../../../di/locator.dart';

class AdminPanelScreen extends StatelessWidget {
  final String gameId;
  const AdminPanelScreen({super.key, required this.gameId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            GameCubit(socketClient: locator<SocketClient>(), gameId: gameId),
        child: Builder(builder: (context) {
          final gameState = context.watch<GameCubit>().state;

          return AnimatedSwitcher(
            duration: const Duration(
              milliseconds: 500,
            ),
            transitionBuilder: (child, animation) {
              return SlideAnimation(
                begin: const Offset(-1, 0),
                child: child,
              );
            },
            child:
                gameState.shouldBeInLobby ? const LobbyScreen() : const _Body(),
          );
        }),
      ),
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
              return Column(
                children: [
                  const Text('Ask the first Question'),
                  const SizedBox(height: 8.0),
                  AppButton(
                    onTap: () => _showQuestionFormSheet(context),
                    label: 'Ask Question',
                  )
                ],
              );
            },
          ),
          const FinishButton(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showQuestionFormSheet(context),
        child: const Text('Ask'),
      ),
    );
  }

  void _showQuestionFormSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => QuestionForm(
        onAsk: (question) {
          context.read<GameCubit>().askQuestion(question);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
