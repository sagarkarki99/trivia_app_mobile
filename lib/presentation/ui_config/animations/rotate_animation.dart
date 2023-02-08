import 'package:flutter/material.dart';

import './base_animation.dart';

class RotateAnimation extends StatelessWidget {
  final double begin;
  final double end;
  final Widget child;
  final Curve? curve;
  final int? durationMs;
  final Alignment alignment;

  const RotateAnimation({
    Key? key,
    this.begin = 0.0,
    this.end = 1.0,
    this.alignment = Alignment.center,
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
        return RotationTransition(
          turns: animation,
          child: child,
          alignment: alignment,
        );
      },
    );
  }
}
