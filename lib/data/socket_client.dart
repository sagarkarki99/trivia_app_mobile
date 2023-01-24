import 'dart:developer';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClientImpl implements SocketClient {
  late IO.Socket socket;
  SocketClientImpl() {
    socket = IO.io(
        'http://localhost:3001',
        IO.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .build());
  }

  @override
  recieveOn(String event, Function(dynamic data) onDataRecieve) {
    socket.on(event, (data) => log(data));
  }

  @override
  send(String event, payload) {
    socket.emit(event, (data) => log(data));
  }

  @override
  disconnect() {
    socket.disconnect();
  }
}

abstract class SocketClient {
  send(String event, dynamic payload);
  recieveOn(String event, Function(dynamic data) onDataRecieve);

  disconnect();
}

class GameInputEvent {
  static const String createGame = 'createGame';
}

enum GameOutputEvent { gameCreated }
