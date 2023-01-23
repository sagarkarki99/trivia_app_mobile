import 'package:flutter/material.dart';
import 'package:trivia_app/admin_game_page.dart';
import 'package:trivia_app/player_game_page.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TriviaApp(),
    );
  }
}

class TriviaApp extends StatefulWidget {
  const TriviaApp({super.key});

  @override
  State<TriviaApp> createState() => _TriviaAppState();
}

class _TriviaAppState extends State<TriviaApp> {
  IO.Socket socket = IO.io(
      'http://localhost:3001',
      IO.OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .build());
  @override
  void initState() {
    socket.connect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Flexible(child: UserList(users: [])),
        Flexible(
            child: Column(
          children: [
            MaterialButton(
              child: const Text('Create Game'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AdminGamePage(socket: socket),
                ),
              ),
            ),
            MaterialButton(
              child: const Text('Join Game'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => PlayerGamePage(socket: socket),
                      settings: RouteSettings(arguments: socket)),
                );
              },
            )
          ],
        ))
      ],
    );
  }
}

class UserList extends StatelessWidget {
  final List<User> users;
  const UserList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class User {
  String id;
  String name;

  User({required this.id, required this.name});
}
