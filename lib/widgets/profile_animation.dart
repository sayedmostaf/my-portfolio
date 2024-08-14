import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';

class ProfileAnimation extends StatefulWidget {
  final bool useProfile; // Added parameter

  const ProfileAnimation({super.key, this.useProfile = false});

  @override
  State<ProfileAnimation> createState() => _ProfileAnimationState();
}

class _ProfileAnimationState extends State<ProfileAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: const Offset(0, 0.05),
      end: const Offset(0, 0),
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image.asset(
        widget.useProfile
            ? AppAssets.profile2
            : AppAssets.profile1, // Conditional asset loading
        width: 450,
        height: 450,
        fit: BoxFit.fill,
      ),
    );
  }
}
