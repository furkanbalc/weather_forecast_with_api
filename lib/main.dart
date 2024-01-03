import 'package:flutter/material.dart';
import 'package:weather_app/feature/view/home_view.dart';
import 'package:weather_app/product/constants/app_strings.dart';
import 'package:weather_app/product/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.kAppName,
      theme: lightTheme(),
      home: const HomeView(),
    );
  }
}
