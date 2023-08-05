import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trivia_app/presentation/home/auth_cubit/auth_cubit.dart';
import 'package:trivia_app/presentation/home/cubit/home_cubit.dart';
import 'package:trivia_app/presentation/game/ui/screens/playground_screen.dart';
import 'package:trivia_app/presentation/game/ui/screens/admin_panel_screen.dart';
import 'package:trivia_app/presentation/home/widgets/action_item.dart';
import 'package:trivia_app/presentation/ui_config/global_widgets/google_button.dart';
import 'package:trivia_app/presentation/ui_config/global_widgets/loading_widget.dart';
import 'package:trivia_app/presentation/ui_config/theme_extensions.dart';

import '../../data/socket_client.dart';
import '../../di/locator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(
            socketClient: locator<SocketClient>(),
            authCubit: context.read<AuthCubit>()),
        child: const _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: (message) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Dialog(
                insetAnimationCurve: Curves.bounceIn,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LoadingWidget(message: message)),
              ),
            );
          },
          gameCreated: (gameId) {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AdminPanelScreen(gameId: gameId),
              ),
            );
          },
          gameJoined: (initialState) {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    PlaygroundScreen(initialState: initialState),
              ),
            );
          },
        );
      },
      builder: (ctx, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const WelcomeText(),
            SvgPicture.asset(
              'assets/images/quiz.svg',
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActionItem(
                  label: 'Create Game',
                  iconData: FluentIcons.form_20_filled,
                  onTap: () => cubit.createGame(),
                ),
                ActionItem(
                  label: 'Join Game',
                  iconData: FluentIcons.arrow_join_20_filled,
                  onTap: () async {
                    await _showLoginUi(context);

                    //   Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => JoiningGameScreen(homeCubit: cubit),
                    //   ),
                    // );
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> _showLoginUi(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Seems like there is no user at the moment.',
                style: ctx.theme.textTheme.displaySmall),
            const SizedBox(height: 12),
            GoogleButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                return context.read<AuthCubit>().signInWithGoogle();
              },
            )
          ],
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        WavyAnimatedText('Welcome to Fuse Trivia.',
            textStyle: Theme.of(context).textTheme.displayLarge)
      ],
    );
  }
}
