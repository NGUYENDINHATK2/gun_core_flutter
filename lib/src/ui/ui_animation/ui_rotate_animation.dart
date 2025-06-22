import 'package:flutter/material.dart';

class UIRotateAnimation extends StatefulWidget {
  final bool? isRotate;
  final double? angle;
  final Widget? child;
  final double? duration;
  const UIRotateAnimation({
    super.key,
    this.isRotate,
    this.angle,
    this.child,
    this.duration,
  });

  @override
  State<UIRotateAnimation> createState() => _UIRotateAnimationState();
}

class _UIRotateAnimationState extends State<UIRotateAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: widget.duration!.toInt()),
      vsync: this,
    )..repeat();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: widget.isRotate! ? _controller.value * widget.angle! : 0,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
