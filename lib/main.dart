import 'package:flutter/material.dart';
import 'package:trivia_app/di/locator.dart';
import 'package:trivia_app/trivia_app.dart';

Future<void> main() async {
  await setupLocator();
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

class User {
  String id;
  String name;

  User({required this.id, required this.name});
}
