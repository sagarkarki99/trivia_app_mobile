import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/game_cubit.dart';

class ConnectedUsersUi extends StatelessWidget {
  const ConnectedUsersUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        final users = state.connectedUsers;
        if (users.isEmpty) return const Text('Waiting for users...');
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: ((context, index) => Text(users[index].name)),
        );
      },
    );
  }
}
