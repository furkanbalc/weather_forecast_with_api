import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/feature/view/forecast_view.dart';
import 'package:weather_app/feature/view_model/home_provider.dart';
import 'package:weather_app/product/constants/app_colors.dart';
import 'package:weather_app/product/extension/index.dart';

class DailyWeatherItems extends StatefulWidget {
  const DailyWeatherItems({super.key});

  @override
  State<DailyWeatherItems> createState() => _DailyWeatherItemsState();
}

class _DailyWeatherItemsState extends State<DailyWeatherItems> {
  @override
  Widget build(BuildContext context) {
    var models = context.watch<HomeProvider>().dailyItems;
    var locationData = context.watch<HomeProvider>().locationData;
    var read = context.read<HomeProvider>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.network('https://openweathermap.org/img/wn/${models?[0].icon}@4x.png', height: 40),
                  Text(
                    'Bugün',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.goldenSamowar),
                  ),
                ],
              ),
              Text(
                locationData?.forecast?.toUpperCase() ?? '',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w300, color: Colors.white),
              ),
              Text(
                '${locationData?.temp?.toInt()}°C',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
        Column(
          children: List.generate(2, (index) {
            final iconUrl = 'https://openweathermap.org/img/wn/${models?[index].icon}@4x.png';
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.network(iconUrl, height: 40),
                      Text(
                        index == 0 ? (models?[index].date ?? '') : read.parseDate(date: models?[index].date ?? ''),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.goldenSamowar),
                      ),
                    ],
                  ),
                  Text(
                    models?[index].description?.toUpperCase() ?? '',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w300, color: Colors.white),
                  ),
                  Text(
                    '${models?[index].temperature?.toInt()}°C',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            );
          }),
        ),
        InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => ForecastView(dailyItems: models, model: locationData))),
          child: Container(
            padding: context.paddings.allLow,
            margin: context.paddings.allLow,
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                '5 günlük hava durumu tahmini',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w300, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
