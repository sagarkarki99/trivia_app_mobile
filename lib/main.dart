import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trivia_app/di/locator.dart';
import 'package:trivia_app/firebase_options.dart';
import 'package:trivia_app/trivia_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocator();
  runApp(const TriviaApp());
}
