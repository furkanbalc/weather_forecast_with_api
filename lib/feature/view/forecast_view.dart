import 'package:flutter/material.dart';
import 'package:weather_app/feature/model/weather_daily_model.dart';
import 'package:weather_app/feature/model/weather_model.dart';
import 'package:weather_app/product/constants/app_colors.dart';
import 'package:weather_app/product/enums/index.dart';
import 'package:weather_app/product/extension/index.dart';
import 'package:weather_app/product/utility/index.dart';

class ForecastView extends StatelessWidget {
  const ForecastView({super.key, required this.dailyItems, required this.model});
  final List<WeatherDailyModel>? dailyItems;
  final WeatherModel? model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.fiantingLight,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new),
          color: AppColors.whiteColor,
        ),
      ),
      body: Container(
        decoration: BoxDecorations.backgroundDecoration,
        child: Column(
          children: [
            Text('${model?.city}, ${model?.country}',
                style: context.textStyles.headlineSmall.copyWith(color: AppColors.whiteColor)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Max: ${model?.tempMax.toInt()}',
                    style: context.textStyles.titleMedium.copyWith(color: AppColors.whiteColor)),
                Text('Min: ${model?.tempMin.toInt()}',
                    style: context.textStyles.titleMedium.copyWith(color: AppColors.whiteColor)),
              ],
            ),
            const SizedBox(height: 20),
            _dailyWeatherListView(),
          ],
        ),
      ),
    );
  }

  Widget _dailyWeatherListView() {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dailyItems?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final iconUrl = 'https://openweathermap.org/img/wn/${dailyItems?[index].icon}@4x.png';
          return Container(
            width: MediaQuery.sizeOf(context).width / 5,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecorations.dailyContainerDecoration,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${dailyItems?[index].temperature?.toInt()}°C',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.whiteColor),
                  ),
                  Image.network(iconUrl),
                  Text(
                    dailyItems?[index].description?.toUpperCase() ?? '',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w300, color: AppColors.whiteColor),
                  ),
                  Text(
                    index == 0 ? (dailyItems?[index].date ?? '') : parseDate(date: dailyItems?[index].date ?? ''),
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.goldenSamowar),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String parseDate({required String date}) {
    DateTime dateTime = DateTime.parse(date);
    return getDayOfWeek(dateTime.weekday);
  }

  String getDayOfWeek(int? day) {
    switch (day) {
      case 1:
        return Days.mon.value;
      case 2:
        return Days.tue.value;
      case 3:
        return Days.wed.value;
      case 4:
        return Days.thu.value;
      case 5:
        return Days.fri.value;
      case 6:
        return Days.sat.value;
      case 7:
        return Days.sun.value;
      default:
        return "";
    }
  }
}
