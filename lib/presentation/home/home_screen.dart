import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/presentation/home/auth_cubit/auth_cubit.dart';
import 'package:trivia_app/presentation/home/cubit/home_cubit.dart';
import 'package:trivia_app/presentation/game/ui/screens/joining_game_screen.dart';
import 'package:trivia_app/presentation/game/ui/screens/playground_screen.dart';
import 'package:trivia_app/presentation/game/ui/screens/admin_panel_screen.dart';

import '../../data/socket_client.dart';
import '../../di/locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(
            socketClient: locator<SocketClient>(),
            authCubit: context.read<AuthCubit>()),
        child: const _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          gameCreated: (gameId) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AdminPanelScreen(gameId: gameId),
              ),
            );
          },
          gameJoined: (initialState) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    PlaygroundScreen(initialState: initialState),
              ),
            );
          },
        );
      },
      builder: (ctx, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => cubit.createGame(),
                child: const Text('Create Game')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => JoiningGameScreen(homeCubit: cubit),
                ),
              ),
              child: const Text('Join Game'),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
