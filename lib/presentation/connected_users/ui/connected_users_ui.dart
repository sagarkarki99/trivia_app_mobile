import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../game_cubit/game_cubit.dart';

class ConnectedUsersUi extends StatelessWidget {
  const ConnectedUsersUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        final users = state.connectedUsers;
        if (users.isEmpty) return const Text('Waiting for users...');
        return AnimatedList(
          itemBuilder: (context, index, animation) => Text(users[index].name),
          initialItemCount: users.length,
        );
      },
    );
  }
}
