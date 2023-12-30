import 'package:flutter/material.dart';
import 'package:weather_app/feature/model/weather_daily_model.dart';
import 'package:weather_app/feature/view_model/home_provider.dart';
import 'package:weather_app/feature/widgets/base_scaffold.dart';
import 'package:weather_app/feature/widgets/daily_weather_container.dart';
import 'package:weather_app/feature/widgets/main_datas_widget.dart';
import 'package:weather_app/feature/widgets/search_text_field.dart';
import 'package:weather_app/product/constants/app_colors.dart';
import 'package:weather_app/product/enums/app_lotties.dart';
import 'package:weather_app/product/service/project_dio_mixin.dart';
import 'package:weather_app/product/utility/box_decoration.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/product/widgets/custom_centered_lottie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with ProjectDioMixin {
  @override
  Widget build(BuildContext context) {
    var dailyItems = context.watch<HomeProvider>().dailyItems;
    var read = context.read<HomeProvider>();
    var watch = context.watch<HomeProvider>();
    var isLoading = context.watch<HomeProvider>().isLoading;
    return BaseScaffold(
      resizeToAvoidBottomInset: false,
      fabButton: FloatingActionButton(
        backgroundColor: AppColors.goldenSamowar,
        onPressed: () async => await read.getDevicePositionAndGetCurrentLocationData(),
        child: const Icon(Icons.location_on_outlined, color: Colors.black54),
      ),
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SearchTextField(
                  onChanged: watch.setCity,
                  searched: () async {
                    await watch.getCityData();
                  },
                ),
                const MainDatas(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: _dailyWeatherListView(dailyItems),
                  ),
                ),
              ],
            ),
    );
  }

  ListView _dailyWeatherListView(List<WeatherDailyModel>? dailyItems) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: dailyItems?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(5),
          width: MediaQuery.sizeOf(context).width / 3,
          decoration: BoxDecorations.dailyContainerDecoration,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                DailyWeatherContainer(index: index),
                _windyInfo(dailyItems, index, context),
              ],
            ),
          ),
        );
      },
    );
  }

  Positioned _windyInfo(List<WeatherDailyModel>? dailyItems, int index, BuildContext context) {
    return Positioned(
      top: 10,
      child: Column(
        children: [
          CustomCenteredLottie(lottie: AppLotties.windy.toLottie, height: 30),
          Text(
            '${dailyItems?[index].wind}\nm/s',
            style:
                Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w300, color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
