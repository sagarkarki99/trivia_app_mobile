import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/presentation/game_cubit/game_cubit.dart';
import 'package:trivia_app/presentation/question_panel/ui/admin_panel_screen.dart';

import '../data/socket_client.dart';
import '../di/locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameCubit>(
      create: (context) => GameCubit(socketClient: locator<SocketClient>()),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GameCubit>();
    return BlocConsumer<GameCubit, GameState>(
      listener: (context, state) {
        log(state.toString());
      },
      builder: (ctx, state) {
        return state.status.maybeWhen(
            gameCreated: () => const AdminPanelScreen(),
            orElse: () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () => cubit.createGame(),
                        child: const Text('Create Game')),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () => cubit.joinGame(),
                        child: const Text('Join Game')),
                  ],
                ));
      },
    );
  }
}
