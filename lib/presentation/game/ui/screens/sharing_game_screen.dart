import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:trivia_app/presentation/game/cubit/game_cubit.dart';

class SharingGameScreen extends StatelessWidget {
  const SharingGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gameId = context.read<GameCubit>().state.gameId;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            QrImage(
              data: gameId,
              size: 200,
            ),
            const SizedBox(height: 20),
            const _SelectableGameId()
          ],
        ),
      ),
    );
  }
}

class _SelectableGameId extends StatefulWidget {
  const _SelectableGameId();

  @override
  State<_SelectableGameId> createState() => __SelectableGameIdState();
}

class __SelectableGameIdState extends State<_SelectableGameId> {
  bool isSelected = false;
  late final String gameId;

  @override
  void initState() {
    super.initState();
    isgameIdSelected();
    gameId = context.read<GameCubit>().state.gameId;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isgameIdSelected();
  }

  Future<void> isgameIdSelected() async {
    final value = await Clipboard.getData('text/plain');
    if (value == null || value.text != gameId) {
      setState(() {
        isSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: Theme.of(context).backgroundColor,
          ),
          padding: const EdgeInsets.all(6.0),
          child: Text(gameId),
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isSelected
                ? const SmallButton(
                    label: 'Copied!',
                    icon: Icons.done,
                    onTap: null,
                  )
                : SmallButton(
                    label: 'Copy',
                    icon: Icons.copy,
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(text: gameId));
                      setState(() {
                        isSelected = true;
                      });
                    },
                  ),
            const SizedBox(width: 8.0),
            SmallButton(
              label: 'Share',
              icon: Icons.share,
              onTap: () async {},
            )
          ],
        )
      ],
    );
  }
}

class SmallButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final String label;
  const SmallButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor.withOpacity(0.6),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14,
            ),
            const SizedBox(width: 4.0),
            Text(label),
          ],
        ),
      ),
    );
  }
}
