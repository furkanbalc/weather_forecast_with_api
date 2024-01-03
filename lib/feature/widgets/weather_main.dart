import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/feature/view_model/home_provider.dart';
import 'package:weather_app/product/extension/text_style.dart';

class WeatherMain extends StatelessWidget {
  const WeatherMain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var model = context.watch<HomeProvider>().locationData;
    final iconUrl = 'https://openweathermap.org/img/wn/${model?.icon}@4x.png';

    return Column(
      children: [
        Image.network(iconUrl),
        Text(
          model?.forecast?.toUpperCase() ?? '',
          style: context.textStyles.titleMedium.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 20),
        Text(
          '${model?.temp?.toInt()}°',
          style: context.textStyles.displayMedium.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          '${model?.city}, ${model?.country}',
          style: context.textStyles.headlineMedium.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
