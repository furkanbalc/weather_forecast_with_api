import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app/feature/view/splash_view.dart';
import 'package:weather_app/feature/view/welcome_view.dart';

abstract class SplashViewModel extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController controller;
  List<Widget> rainDrops = [];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    controller.addStatusListener((status) {
      _isEndAnimation(status);
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _isEndAnimation(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (mounted) {
        Timer(const Duration(seconds: 1), () {
          if (mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const WelcomeView()),
            );
          }
        });
      }
    }
  }
}
