import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/models/game_state.dart';
import 'package:trivia_app/presentation/game/cubit/game_cubit.dart';
import 'package:trivia_app/presentation/game/round_cubit/round_cubit.dart';
import 'package:trivia_app/presentation/game/ui/widgets/question_view.dart';

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
              ? const Text('Waiting for question')
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
