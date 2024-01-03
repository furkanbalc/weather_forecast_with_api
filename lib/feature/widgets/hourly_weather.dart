import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/feature/view_model/home_provider.dart';
import 'package:weather_app/product/constants/app_colors.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({super.key});

  @override
  Widget build(BuildContext context) {
    var models = context.watch<HomeProvider>().hourlyItems;

    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: models!.length,
        itemBuilder: (BuildContext context, int index) {
          var iconUrl = 'https://openweathermap.org/img/wn/${models[index].icon}@4x.png';
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${models[index].temperature?.toInt()}°',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              Image.network(iconUrl, height: 75),
              Text(
                '${DateTime.parse(models[index].date!).hour}:00',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.goldenSamowar),
              ),
            ],
          );
        },
      ),
    );
  }
}
