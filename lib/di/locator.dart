import 'package:get_it/get_it.dart';
import 'package:trivia_app/data/socket_client.dart';

GetIt locator = GetIt.instance;
Future<void> setupLocator() async {
  locator.registerLazySingleton<SocketClient>(() => SocketClientImpl());
  await locator.allReady();
}
