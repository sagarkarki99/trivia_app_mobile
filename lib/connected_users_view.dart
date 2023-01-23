import 'package:socket_io_client/src/socket.dart';

import 'package:flutter/material.dart';
import 'package:trivia_app/models/game_state.dart';

class ConnectedUsersView extends StatefulWidget {
  Socket socket;
  GameState? gameState;
  ConnectedUsersView({this.gameState, super.key, required this.socket});

  @override
  State<ConnectedUsersView> createState() => _ConnectedUsersViewState();
}

class _ConnectedUsersViewState extends State<ConnectedUsersView> {
  GameState? gameState;

  @override
  void initState() {
    gameState = widget.gameState ?? GameState(connectedUsers: []);
    widget.socket.on('joined', (game) {
      setState(() {
        gameState = GameState.fromJson(game as Map<String, dynamic>);
      });
    });
    widget.socket.on('newUserJoined', (userJson) {
      final user = ConnectedUsers.fromJson(userJson as Map<String, dynamic>);
      setState(() {
        gameState!.connectedUsers = List.of(gameState!.connectedUsers!)
          ..add(user);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text('Connected Users'),
            ...gameState!.connectedUsers!
                .map((user) => ListTile(
                      title: Text(user.name ?? ''),
                      dense: true,
                      leading: const Icon(Icons.account_box),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
