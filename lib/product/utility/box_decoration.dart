import 'package:flutter/material.dart';
import 'package:weather_app/product/constants/app_colors.dart';

class BoxDecorations {
  static BoxDecoration backgroundDecoration = const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        AppColors.fiantingLight,
        AppColors.blueGem,
        AppColors.moonShadow,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 0.5, 1.0],
      tileMode: TileMode.clamp,
    ),
  );

  static BoxDecoration dailyContainerDecoration = backgroundDecoration.copyWith(
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.5),
        spreadRadius: 1,
        blurRadius: 1,
        offset: const Offset(0, 3),
      ),
    ],
    borderRadius: const BorderRadius.vertical(
      top: Radius.circular(40),
      bottom: Radius.circular(40),
    ),
  );
}
