import 'package:flutter/material.dart';

class BounceAnimation<T> extends StatefulWidget {
  final T value;
  final Widget child;
  final double? begin;
  final double? end;
  final bool autoStart;
  final bool Function(T)? shouldAnimate;

  const BounceAnimation({
    Key? key,
    required this.value,
    required this.child,
    this.begin,
    this.end,
    this.autoStart = false,
    this.shouldAnimate,
  }) : super(key: key);

  @override
  State<BounceAnimation<T>> createState() => _BounceAnimationState();
}

class _BounceAnimationState<T> extends State<BounceAnimation<T>>
    with SingleTickerProviderStateMixin {
  late final Animation<double> animation;
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    animation = Tween<double>(
      begin: widget.begin ?? 1.0,
      end: widget.end ?? 1.3,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceInOut,
      ),
    );

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      }
    });

    if (widget.autoStart) animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant BounceAnimation<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value &&
        (widget.shouldAnimate?.call(widget.value) ?? true)) {
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: widget.child,
    );
  }
}
