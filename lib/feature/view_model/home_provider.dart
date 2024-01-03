import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/feature/model/weather_daily_model.dart';
import 'package:weather_app/feature/model/weather_model.dart';
import 'package:weather_app/feature/service/weather_service.dart';
import 'package:weather_app/product/enums/days.dart';
import 'package:weather_app/product/helper/show_alert_dialog.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider(this.weatherService, this.context) {
    _init();
  }
  final BuildContext context;
  final IWeatherService weatherService;
  List<List<WeatherDailyModel>>? forecastItems;
  List<WeatherDailyModel>? dailyItems;
  List<WeatherDailyModel>? hourlyItems;

  bool serviceEnabled = true;
  bool permissionDone = true;
  late Position currentPosition;
  WeatherModel? locationData;
  String? locate;
  bool isLoading = false;

  Future<void> _init() async {
    await getCurrentLocation(context: context);
  }

  Future<void> getDevicePositionAndGetCurrentLocationData() async {
    locationData = await weatherService.getLocationDataByLatLon(devicePosition: currentPosition);
    forecastItems = await weatherService.getDailyForecastByLatLon(devicePosition: currentPosition);
    dailyItems = forecastItems?[1];
    hourlyItems = forecastItems?[0];
    notifyListeners();
  }

  Future<void> getCityData() async {
    changeLoading();
    locationData = await weatherService.getLocationDataByLocation(city: locate ?? '', context: context);
    forecastItems = await weatherService.getDailyForecastByLocation(city: locate ?? '', context: context);
    dailyItems = forecastItems?[1];
    hourlyItems = forecastItems?[0];
    changeLoading();
    notifyListeners();
  }

  Future<void> getCurrentLocation({required BuildContext context}) async {
    changeLoading();
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // ignore: use_build_context_synchronously
        showAlerDialog(context: context, message: 'Konum izni reddedildi. Lütfen ayarlarınızı kontrol edin.');
        changePermission();
        changeLoading();

        return;
      }
    }
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // ignore: use_build_context_synchronously
      showAlerDialog(context: context, message: 'Konum servisiniz kapalı. Lütfen ayarlarınızı kontrol edin.');
      serviceEnabled = false;
      notifyListeners();
      changeLoading();
      return;
    }
    currentPosition = await Geolocator.getCurrentPosition();
    await getDevicePositionAndGetCurrentLocationData();
    changeLoading();
  }

  void reset() {
    dailyItems = [];
    locationData = null;
    notifyListeners();
  }

  void setCity(String city) {
    locate = city;
    notifyListeners();
  }

  void changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void changePermission() {
    permissionDone = !permissionDone;
    notifyListeners();
  }

  void changeEnabled() {
    permissionDone = !permissionDone;
    notifyListeners();
  }

  String parseDate({required String date}) {
    DateTime dateTime = DateTime.parse(date);
    return getDayOfWeek(dateTime.weekday);
  }

  String parseHour({required String date}) {
    DateTime dateTime = DateTime.parse(date);
    return dateTime.hour.toString();
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
