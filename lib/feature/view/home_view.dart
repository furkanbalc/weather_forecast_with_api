import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/feature/service/weather_service.dart';
import 'package:weather_app/feature/view_model/home_provider.dart';
import 'package:weather_app/feature/widgets/hourly_weather.dart';
import 'package:weather_app/feature/widgets/index.dart';
import 'package:weather_app/product/constants/app_colors.dart';
import 'package:weather_app/product/helper/show_alert_dialog.dart';
import 'package:weather_app/product/service/project_dio_mixin.dart';
import 'package:weather_app/product/utility/index.dart';
import 'package:weather_app/product/widgets/index.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(WeatherService(service), context),
      builder: (context, child) {
        var watch = context.watch<HomeProvider>();
        var isLoading = context.watch<HomeProvider>().isLoading;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: AppColors.fiantingLight,
            title: SearchTextField(
              onChanged: watch.setCity,
              searched: () async {
                watch.locate != '' && watch.locate != null
                    ? await watch.getCityData()
                    : showAlerDialog(context: context, message: 'Lütfen geçerli bir lokasyon giriniz');
              },
            ),
          ),
          body: watch.permissionDone && watch.serviceEnabled
              ? Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecorations.backgroundDecoration,
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView(
                          children: [
                            WeatherDetailCard(
                              decoration: BoxDecorations.weatherTopDetailDecoration,
                              child: const WeatherDetailsTemp(),
                            ),
                            const WeatherMain(),
                            const SizedBox(height: 20),
                            WeatherDetailCard(
                              decoration: BoxDecorations.weatherDetailDecoration,
                              child: const WeatherDetailsWidget(),
                            ),
                            const SizedBox(height: 20),
                            WeatherDetailCard(
                              decoration: BoxDecorations.weatherDetailDecoration,
                              child: const HourlyWeather(),
                            ),
                            const SizedBox(height: 20),
                            WeatherDetailCard(
                              decoration: BoxDecorations.weatherDetailDecoration,
                              child: const DailyWeatherItems(),
                            ),
                          ],
                        ),
                )
              : Container(
                  decoration: BoxDecorations.backgroundDecoration,
                  child: Center(
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : CustomElevatedButton(
                            onPressed: () async {
                              await watch.getCurrentLocation(context: context);
                            },
                            buttonWidth: MediaQuery.sizeOf(context).width * 0.7,
                            text: 'Tekrar Dene',
                          ),
                  ),
                ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.goldenSamowar,
            onPressed: () async => await watch.getCurrentLocation(context: context),
            child: const Icon(Icons.location_on_outlined, color: Colors.black54),
          ),
        );
      },
    );
  }
}
