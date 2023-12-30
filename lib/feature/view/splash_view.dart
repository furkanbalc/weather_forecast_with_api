import 'package:flutter/material.dart';
import 'package:parallax_rain/parallax_rain.dart';
import 'package:weather_app/feature/view_model/splash_view_model.dart';
import 'package:weather_app/product/enums/app_images.dart';
import 'package:weather_app/product/utility/box_decoration.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends SplashViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecorations.backgroundDecoration,
        child: _rainEffectAndAnimationLogo(),
      ),
    );
  }

  ParallaxRain _rainEffectAndAnimationLogo() {
    return ParallaxRain(
      dropFallSpeed: 8,
      dropWidth: 0.3,
      dropColors: const [Colors.blueGrey],
      child: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return Transform.scale(
              scale: controller.value,
              child: Image.asset(
                AppImages.rainy.toImage,
                height: MediaQuery.sizeOf(context).width / 2,
              ),
            );
          },
        ),
      ),
    );
  }
}
