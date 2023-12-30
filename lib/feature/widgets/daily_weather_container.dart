import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/feature/view_model/home_provider.dart';
import 'package:weather_app/product/constants/app_colors.dart';

class DailyWeatherContainer extends StatelessWidget {
  const DailyWeatherContainer({super.key, required this.index});

  final int index;
  @override
  Widget build(BuildContext context) {
    var dailyItems = context.watch<HomeProvider>().dailyItems;
    var read = context.read<HomeProvider>();
    final iconUrl = 'https://openweathermap.org/img/wn/${dailyItems?[index].icon}@4x.png';

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '${dailyItems?[index].temperature?.toInt()}°C',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Image.network(iconUrl),
        Text(
          dailyItems?[index].description?.toUpperCase() ?? '',
          textAlign: TextAlign.center,
          maxLines: 2,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w300, color: Colors.white),
        ),
        Text(
          index == 0 ? (dailyItems?[index].date ?? '') : read.parseDate(date: dailyItems?[index].date ?? ''),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: AppColors.goldenSamowar),
        ),
      ],
    );
  }
}
