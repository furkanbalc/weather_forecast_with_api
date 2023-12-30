import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/feature/service/weather_service.dart';
import 'package:weather_app/feature/view/splash_view.dart';
import 'package:weather_app/feature/view_model/home_provider.dart';
import 'package:weather_app/product/constants/app_strings.dart';
import 'package:weather_app/product/service/project_dio_mixin.dart';
import 'package:weather_app/product/theme/light_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(WeatherService(Dio(BaseOptions(baseUrl: baseUrl)))),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget with ProjectDioMixin {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.kAppName,
      theme: lightTheme(),
      home: const SplashView(),
    );
  }
}
