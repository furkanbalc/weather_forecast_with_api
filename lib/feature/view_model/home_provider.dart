import 'package:flutter/material.dart';
import 'package:weather_app/feature/model/weather_daily_model.dart';
import 'package:weather_app/feature/model/weather_model.dart';
import 'package:weather_app/feature/service/weather_service.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider(this.weatherService) {
    _init();
  }
  final IWeatherService weatherService;
  List<String> weekdays = ["Pazartesi", "Salı", "Çarşamba", "Perşembe", "Cuma", "Cumartesi", "Pazar"];
  List<WeatherDailyModel>? dailyItems;
  WeatherModel? locationData;
  String? locate;
  bool isLoading = false;

  void reset() {
    dailyItems = [];
    locationData = null;
    notifyListeners();
  }

  void setCity(String city) {
    locate = city;
    notifyListeners();
  }

  void _changeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> _init() async {
    _changeLoading();
    await getDevicePositionAndGetCurrentLocationData();
    _changeLoading();
  }

  Future<void> getDevicePositionAndGetCurrentLocationData() async {
    var devicePosition = await weatherService.determinePosition();
    locationData = await weatherService.getLocationDataByLatLon(devicePosition: devicePosition);
    dailyItems = await weatherService.getDailyForecastByLatLon(devicePosition: devicePosition);
    notifyListeners();
  }

  Future<void> getCityData() async {
    _changeLoading();
    locationData = await weatherService.getLocationDataByLocation(city: locate ?? '');
    dailyItems = await weatherService.getDailyForecastByLocation(city: locate ?? '');
    _changeLoading();
    setCity('');
    notifyListeners();
  }

  String parseDate({required String date}) {
    DateTime dateTime = DateTime.parse(date);
    return getDayOfWeek(dateTime.weekday);
  }

  String getDayOfWeek(int? day) {
    switch (day) {
      case 1:
        return "Pazartesi";
      case 2:
        return "Salı";
      case 3:
        return "Çarşamba";
      case 4:
        return "Perşembe";
      case 5:
        return "Cuma";
      case 6:
        return "Cumartesi";
      case 7:
        return "Pazar";
      default:
        return "";
    }
  }
}
