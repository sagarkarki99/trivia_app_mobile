import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/presentation/game/cubit/game_cubit.dart';

class FinishButton extends StatelessWidget {
  const FinishButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GameCubit>();
    return ElevatedButton(
        onPressed: () => cubit.finishGame(), child: const Text('Finish Game'));
  }
}
