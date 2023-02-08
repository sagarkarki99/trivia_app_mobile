import 'package:flutter/material.dart';

import './base_animation.dart';

class SlideAnimation extends StatelessWidget {
  final Offset begin;
  final Offset end;
  final Widget child;
  final Curve? curve;
  final int? durationMs;

  const SlideAnimation({
    Key? key,
    required this.begin,
    this.end = Offset.zero,
    this.curve,
    this.durationMs,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseAnimation<Offset>(
      begin: begin,
      end: end,
      curve: curve,
      durationMs: durationMs,
      builder: (animation) {
        return SlideTransition(
          position: animation,
          child: child,
        );
      },
    );
  }
}
