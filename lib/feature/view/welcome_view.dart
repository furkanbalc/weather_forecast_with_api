import 'package:flutter/material.dart';
import 'package:weather_app/feature/view/home_view.dart';
import 'package:weather_app/feature/widgets/base_scaffold.dart';
import 'package:weather_app/product/constants/app_colors.dart';
import 'package:weather_app/product/constants/app_strings.dart';
import 'package:weather_app/product/enums/app_images.dart';
import 'package:weather_app/product/widgets/custom_elevated_button.dart';

part '../widgets/welcome_body.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Image.asset(AppImages.rainy.toImage)),
          const Expanded(child: _WelcomeBody()),
        ],
      ),
    );
  }
}
