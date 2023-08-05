import 'package:flutter/material.dart';

class ScaleAnimatedSwitcher extends StatelessWidget {
  final Widget child;
  final int durationMs;

  const ScaleAnimatedSwitcher({
    Key? key,
    required this.child,
    this.durationMs = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      child: child,
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      duration: Duration(milliseconds: durationMs),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
    );
  }
}
