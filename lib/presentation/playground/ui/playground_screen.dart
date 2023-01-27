import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/models/game_state.dart';
import 'package:trivia_app/presentation/question_panel/ui/admin_panel_screen.dart';

import '../../../data/socket_client.dart';
import '../../../di/locator.dart';
import '../../game_cubit/game_cubit.dart';
import '../../round/round_cubit.dart';

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
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        return state.activeRound == null
            ? const Text('Waiting for question')
            : BlocProvider.value(
                value: state.activeRound!,
                child: const AnsweringView(),
              );
      },
    );
  }
}

class AnsweringView extends StatelessWidget {
  const AnsweringView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoundCubit, RoundState>(
      builder: (context, state) {
        final question = state.questionPayload;
        return Material(
          child: Column(
            children: [
              Text(question.question,
                  style: Theme.of(context).textTheme.headline3),
              const SizedBox(height: 16),
              ...question.answerOptions
                  .map((answer) => ListTile(
                        title: Text(answer),
                        onTap: () =>
                            context.read<RoundCubit>().answerQuestion(answer),
                      ))
                  .toList(),
              const CountDownUi()
            ],
          ),
        );
      },
    );
  }
}
