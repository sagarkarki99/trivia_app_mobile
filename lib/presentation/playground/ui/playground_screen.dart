import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/models/game_state.dart';

import '../../../data/socket_client.dart';
import '../../../di/locator.dart';
import '../../../models/question_payload.dart';
import '../../game_cubit/game_cubit.dart';

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
        return state.question == null
            ? const Text('Waiting for question')
            : AnsweringView(state.question!);
      },
    );
  }
}

class AnsweringView extends StatelessWidget {
  final QuestionPayload question;
  const AnsweringView(this.question, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Text(question.question, style: Theme.of(context).textTheme.headline3),
          const SizedBox(height: 16),
          ...question.answerOptions
              .map((answer) => ListTile(
                    title: Text(answer),
                    onTap: () =>
                        context.read<GameCubit>().answerQuestion(answer),
                  ))
              .toList()
        ],
      ),
    );
  }
}
