import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/presentation/ui_config/global_widgets/user_avatar.dart';
import 'package:trivia_app/presentation/ui_config/animations/animations.dart';
import 'package:trivia_app/presentation/ui_config/app_colors.dart';

import '../../cubit/game_cubit.dart';

class ConnectedUsersUi extends StatelessWidget {
  const ConnectedUsersUi({super.key});

  @override
  Widget build(BuildContext context) {
    final users = context.watch<GameCubit>().state.connectedUsers;
    return users.isEmpty
        ? const Text('No Players.')
        : AnimatedList(
            key: context.read<GameCubit>().connectedUserListKey,
            initialItemCount: users.length,
            itemBuilder: ((context, index, animation) => ScaleAnimation(
                  key: ValueKey(index),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: UserItem(name: users[index].name),
                  ),
                )),
          );
  }
}

class UserItem extends StatelessWidget {
  final String name;
  const UserItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: AppColors.light.grey,
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        minVerticalPadding: 14,
        visualDensity: VisualDensity.compact,
        dense: true,
        leading: UserAvatar(username: name),
        title: Text(name),
      ),
    );
  }
}
