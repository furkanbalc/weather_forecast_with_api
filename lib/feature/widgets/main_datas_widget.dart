import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/feature/model/weather_model.dart';
import 'package:weather_app/feature/view_model/home_provider.dart';
import 'package:weather_app/product/enums/app_lotties.dart';
import 'package:weather_app/product/widgets/custom_centered_lottie.dart';

class MainDatas extends StatelessWidget {
  const MainDatas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var model = context.watch<HomeProvider>().locationData;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        _weatherIcon(context, model),
        Text(
          model?.forecast?.toUpperCase() ?? '',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        Text(
          '${model?.temp?.toInt()}°',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          model?.city ?? '',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ],
    );
  }

  Row _weatherIcon(BuildContext context, WeatherModel? model) {
    final iconUrl = 'https://openweathermap.org/img/wn/${model?.icon}@4x.png';
    return Row(
      children: [
        Column(
          children: [
            CustomCenteredLottie(lottie: AppLotties.windy.toLottie, height: 50),
            Text(
              '${model?.wind}m/s',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w300, color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).width / 2,
          child: Image.network(iconUrl),
        ),
      ],
    );
  }
}
