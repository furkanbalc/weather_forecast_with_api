import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/feature/view_model/home_provider.dart';
import 'package:weather_app/product/enums/index.dart';
import 'package:weather_app/product/extension/index.dart';
import 'package:weather_app/product/widgets/index.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var model = context.watch<HomeProvider>().locationData;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(child: CustomCenteredLottie(lottie: AppLotties.windy.toLottie, height: 30)),
            Expanded(child: CustomCenteredLottie(lottie: AppLotties.humidity.toLottie, height: 30)),
            Expanded(child: CustomCenteredLottie(lottie: AppLotties.pressure.toLottie, height: 30)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Rüzgar\n${model?.wind}m/s',
                  textAlign: TextAlign.center,
                  style: context.textStyles.titleMedium.copyWith(fontWeight: FontWeight.w300, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Nem\n${model?.humidity}%',
                  textAlign: TextAlign.center,
                  style: context.textStyles.titleMedium.copyWith(fontWeight: FontWeight.w300, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Basınç\n${model?.pressure}mBar',
                  textAlign: TextAlign.center,
                  style: context.textStyles.titleMedium.copyWith(fontWeight: FontWeight.w300, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
