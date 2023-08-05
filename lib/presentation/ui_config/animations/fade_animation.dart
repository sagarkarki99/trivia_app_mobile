import 'package:flutter/material.dart';

import './base_animation.dart';

class FadeAnimation extends StatelessWidget {
  final double begin;
  final double end;
  final Widget child;
  final Curve? curve;
  final int? durationMs;

  const FadeAnimation({
    Key? key,
    this.begin = 0.0,
    this.end = 1.0,
    this.curve,
    this.durationMs,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseAnimation<double>(
      begin: begin,
      end: end,
      curve: curve,
      durationMs: durationMs,
      builder: (animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
