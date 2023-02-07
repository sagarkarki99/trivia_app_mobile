import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/data/socket_client.dart';
import 'package:trivia_app/presentation/game/cubit/game_cubit.dart';
import 'package:trivia_app/presentation/game/ui/screens/sharing_game_screen.dart';
import 'package:trivia_app/presentation/game/ui/widgets/connected_users_ui.dart';

import 'package:trivia_app/presentation/game/ui/widgets/finish_button.dart';
import 'package:trivia_app/presentation/game/ui/widgets/question_view.dart';

import '../../../../di/locator.dart';
import '../../../question_form/question_form.dart';

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
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (ctx) => BlocProvider.value(
                    value: context.read<GameCubit>(),
                    child: const SharingGameScreen(),
                  ),
                );
              },
              child: const Text('Share')),
          const FinishButton(),
          const Text('Connected Users'),
          const Expanded(child: ConnectedUsersUi()),
        ],
      ),
    );
  }
}
