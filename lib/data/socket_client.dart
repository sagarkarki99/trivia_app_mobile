import 'package:socket_io_client/socket_io_client.dart' as io;

abstract class SocketClient {
  send(String event, dynamic payload);
  recieveOn(String event, Function(dynamic data) onDataRecieve);

  disconnect();
}

class SocketClientImpl implements SocketClient {
  late io.Socket socket;
  SocketClientImpl() {
    socket = io.io(
        // 'https://trivia-server.onrender.com',
        'http://localhost:3001',
        io.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .build());
  }

  @override
  recieveOn(String event, Function(dynamic data) onDataRecieve) {
    socket.on(event, (data) => onDataRecieve(data));
  }

  @override
  send(String event, payload) {
    if (!socket.connected) {
      socket = socket.connect();
    }

    socket.emit(event, payload);
  }

  @override
  disconnect() {
    socket.disconnect();
  }
}

class SendingEvent {
  static const String createGame = 'createGame';
  static const String joinGame = 'joinGame';

  static String askQuestion = 'askQuestion';

  static String answerQuestion = 'answerQuestion';

  static String finishGame = 'finishGame';

  static String startGame = 'startGame';
}

class RecievingEvent {
  static const String gameCreated = 'gameCreated';
  static const String gameStarted = 'gameStarted';
  static const String joined = 'joined';
  static const String questionAsked = 'questionAsked';
  static const String newAnswerSubmitted = 'newAnswerSubmitted';
  static const String newUserJoined = 'newUserJoined';
  static const String gameFinished = 'gameFinished';
  static const String userLeft = 'userLeft';
  static const String error = 'error';
}
