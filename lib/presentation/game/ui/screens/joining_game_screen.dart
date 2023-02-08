import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivia_app/presentation/home/cubit/home_cubit.dart';

import '../widgets/game_id_scanner.dart';

class JoiningGameScreen extends StatelessWidget {
  final HomeCubit homeCubit;
  const JoiningGameScreen({super.key, required this.homeCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeCubit,
      child: DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('JoinGame'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Scanner'),
                Tab(text: 'Manual input'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [GameIdScanner(), _GameIdTextfieldView()],
          ),
        ),
      ),
    );
  }
}

class _GameIdTextfieldView extends StatelessWidget {
  const _GameIdTextfieldView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextField(
            onSubmitted: (value) {
              context.read<HomeCubit>().joinGame(value);
            },
          ),
          const SizedBox(),
          ElevatedButton(onPressed: () {}, child: const Text('Join'))
        ],
      ),
    );
  }
}
