import 'package:flutter/material.dart';

class BaseAnimation<T> extends StatefulWidget {
  final T begin;
  final T end;
  final Curve? curve;
  final int? durationMs;
  final Widget Function(Animation<T>) builder;

  const BaseAnimation({
    Key? key,
    required this.begin,
    required this.end,
    this.curve,
    this.durationMs,
    required this.builder,
  }) : super(key: key);

  @override
  State<BaseAnimation<T>> createState() => _BaseAnimationState<T>();
}

class _BaseAnimationState<T> extends State<BaseAnimation<T>>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<T> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(milliseconds: widget.durationMs ?? 400),
      vsync: this,
    );

    animation = Tween<T>(begin: widget.begin, end: widget.end).animate(
      CurvedAnimation(
        parent: animationController,
        curve: widget.curve ?? Curves.easeOutCubic,
      ),
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(animation);
  }
}
