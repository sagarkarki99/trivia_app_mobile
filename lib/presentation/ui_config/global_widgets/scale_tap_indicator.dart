import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class ScaleTapDetector extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Duration? duration;
  final Curve? scaleCurve;
  final double? scaleMinValue;
  final Curve? opacityCurve;
  final double? opacityMinValue;

  const ScaleTapDetector({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.duration,
    this.scaleMinValue,
    this.opacityMinValue,
    this.scaleCurve,
    this.opacityCurve,
  });

  @override
  State<ScaleTapDetector> createState() => _ScaleTapState();
}

class _ScaleTapState extends State<ScaleTapDetector>
    with SingleTickerProviderStateMixin {
  static const double _defaultScaleMin = 0.97;
  static const double _defaultOpacityMin = 0.9;
  static final Curve _defaultScaleCurve = CurveSpring();
  static const Curve _defaultOpacityCurve = Curves.ease;
  static const Duration _defaultDuration = Duration(milliseconds: 300);

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this);
    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 1.0).animate(_animationController);
    _opacityAnimation =
        Tween<double>(begin: 1.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void animate({double? scale, double? opacity}) {
    _animationController.stop();
    _animationController.duration = widget.duration ?? _defaultDuration;

    _scaleAnimation = Tween<double>(
      begin: _scaleAnimation.value,
      end: scale,
    ).animate(CurvedAnimation(
      curve: widget.scaleCurve ?? _defaultScaleCurve,
      parent: _animationController,
    ));

    _opacityAnimation = Tween<double>(
      begin: _opacityAnimation.value,
      end: opacity,
    ).animate(CurvedAnimation(
      curve: widget.opacityCurve ?? _defaultOpacityCurve,
      parent: _animationController,
    ));

    _animationController
      ..reset()
      ..forward();
  }

  Future<void> _onTapDown(_) async {
    animate(
      scale: widget.scaleMinValue ?? _defaultScaleMin,
      opacity: widget.opacityMinValue ?? _defaultOpacityMin,
    );
  }

  void _onTapUp(_) {
    animate(scale: 1.0, opacity: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final isTapEnabled = widget.onTap != null || widget.onLongPress != null;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (_, child) {
        return AnimatedOpacity(
          duration: widget.duration ?? _defaultDuration,
          opacity: _opacityAnimation.value,
          child: Transform.scale(
            alignment: Alignment.center,
            scale: _scaleAnimation.value,
            child: child,
          ),
        );
      },
      child: Listener(
        onPointerDown: isTapEnabled ? _onTapDown : null,
        onPointerCancel: _onTapUp,
        onPointerUp: _onTapUp,
        child: GestureDetector(
          onTap: isTapEnabled ? () => widget.onTap?.call() : null,
          onLongPress: isTapEnabled ? widget.onLongPress : null,
          child: widget.child,
        ),
      ),
    );
  }
}

class CurveSpring extends Curve {
  final SpringSimulation sim;

  CurveSpring()
      : sim = SpringSimulation(
          SpringDescription.withDampingRatio(
            mass: 1,
            ratio: 0.7,
            stiffness: 70,
          ),
          0.0,
          1.0,
          0.0,
        );

  @override
  double transform(double t) => sim.x(t) + t * (1 - sim.x(1.0));
}
