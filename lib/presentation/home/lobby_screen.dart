import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:trivia_app/presentation/game/cubit/game_cubit.dart';
import 'package:trivia_app/presentation/game/ui/screens/sharing_game_screen.dart';
import 'package:trivia_app/presentation/game/ui/widgets/widgets.dart';
import 'package:trivia_app/presentation/ui_config/global_widgets/scale_tap_indicator.dart';

import '../ui_config/animations/animations.dart';
import '../ui_config/app_colors.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final users = context.watch<GameCubit>().state.connectedUsers;
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: PageController(viewportFraction: 1, initialPage: 2),
      children: [
        const SharingGameScreen(),
        BackgroundLoadingScreen(
          body: users.isEmpty
              ? Center(
                  child: Text(
                  'Waiting for users',
                  style: Theme.of(context).textTheme.headline2,
                ))
              : const UserList(),
        )
      ],
    );
  }
}

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('Connected Users',
              style: Theme.of(context).textTheme.headline2),
        ),
        const SizedBox(height: 4.0),
        Divider(
          color: AppColors.light.dark,
        ),
        const Expanded(
          child: ConnectedUsersUi(),
        ),
        const SlideAnimation(
          begin: Offset(0, -1),
          child: ProcessFurtherUI(),
        )
      ],
    );
  }
}

class ProcessFurtherUI extends StatelessWidget {
  const ProcessFurtherUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: AppColors.light.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppButton(
            onTap: () {},
            label: 'Terminate',
          ),
          AppButton(
            onTap: () => context.read<GameCubit>().startGame(),
            icon: const Icon(Icons.arrow_forward_ios_outlined, size: 12),
            label: 'Start',
          ),
        ],
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Icon? icon;
  const AppButton({
    super.key,
    required this.onTap,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTapDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: AppColors.light.grey,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(width: 4.0),
            icon ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class BackgroundLoadingScreen extends StatelessWidget {
  final Widget body;
  const BackgroundLoadingScreen({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: LoadingIndicator(
            indicatorType: Indicator.ballScaleMultiple,
            colors: [AppColors.light.primary.withOpacity(0.1)],
          ),
        ),
        body,
      ],
    ));
  }
}
