import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/feature/view_model/home_provider.dart';
import 'package:weather_app/product/enums/index.dart';
import 'package:weather_app/product/extension/index.dart';
import 'package:weather_app/product/widgets/index.dart';

class WeatherDetailsTemp extends StatelessWidget {
  const WeatherDetailsTemp({
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
            Expanded(child: CustomCenteredLottie(lottie: AppLotties.temp.toLottie, height: 30)),
            Expanded(child: CustomCenteredLottie(lottie: AppLotties.temp.toLottie, height: 30)),
            Expanded(child: CustomCenteredLottie(lottie: AppLotties.temp.toLottie, height: 30)),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: Center(
                child: Text('En Fazla: ${model?.tempMax?.toInt()}°',
                    style: context.textStyles.titleMedium.copyWith(color: Colors.white)),
              ),
            ),
            Expanded(
              child: Center(
                child: Text('Hissedilen: ${model?.tempFeels?.toInt()}°',
                    style: context.textStyles.titleMedium.copyWith(color: Colors.white)),
              ),
            ),
            Expanded(
              child: Center(
                child: Text('En Düşük: ${model?.tempMin?.toInt()}°',
                    style: context.textStyles.titleMedium.copyWith(color: Colors.white)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
