import 'dart:developer' as message;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:socket_io_client/src/socket.dart';
import 'package:trivia_app/connected_users_view.dart';
import 'package:trivia_app/playground.dart';

import 'models/game_state.dart';

class PlayerGamePage extends StatefulWidget {
  Socket socket;
  PlayerGamePage({super.key, required this.socket});

  @override
  State<PlayerGamePage> createState() => _PlayerGamePageState();
}

class _PlayerGamePageState extends State<PlayerGamePage> {
  bool isJoined = false;
  GameState? gameState;
  TextEditingController? controller;
  ConnectedUsers? me;
  @override
  void initState() {
    controller = TextEditingController();
    widget.socket.on('joined', (state) {
      gameState = GameState.fromJson(state as Map<String, dynamic>);
      me = gameState!.connectedUsers!.last;
      setState(() {
        isJoined = true;
        message.log(gameState.toString());
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          TextField(
            controller: controller,
          ),
          MaterialButton(
            child: const Text('Join'),
            onPressed: () {
              message.log('Connection id:${widget.socket.id}');

              widget.socket.emit('joinGame', {
                "gameId": controller!.text,
                "user": {
                  "id": 'id${Random().nextInt(5000)}',
                  "name": 'user${Random().nextInt(5000)}',
                  "imageUrl": 'fsd'
                }
              });
            },
          ),
          if (isJoined)
            Playground(
                socket: widget.socket,
                me: me!,
                gameId: controller!.text,
                users: gameState!.connectedUsers!),
          if (isJoined)
            ConnectedUsersView(
              socket: widget.socket,
              gameState: gameState,
            )
        ],
      ),
    );
  }
}
