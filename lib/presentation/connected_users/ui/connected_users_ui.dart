import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/data/socket_client.dart';
import 'package:trivia_app/di/locator.dart';
import 'package:trivia_app/presentation/game_cubit/game_cubit.dart';

class ConnectedUsersUi extends StatelessWidget {
  const ConnectedUsersUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameCubit(socketClient: locator<SocketClient>()),
      child: Container(),
    );
  }
}
