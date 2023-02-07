import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/presentation/home/auth_cubit/auth_cubit.dart';
import 'package:trivia_app/presentation/home/home_screen.dart';
import 'package:trivia_app/presentation/ui_config/app_theme.dart';

class TriviaApp extends StatelessWidget {
  const TriviaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.light,
        home: const HomeScreen(),
      ),
    );
  }
}
