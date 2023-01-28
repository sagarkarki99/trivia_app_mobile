import 'package:flutter/material.dart';
import 'package:trivia_app/di/locator.dart';
import 'package:trivia_app/trivia_app.dart';

Future<void> main() async {
  await setupLocator();
  runApp(const TriviaApp());
}
