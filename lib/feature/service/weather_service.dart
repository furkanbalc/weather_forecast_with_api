import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/feature/model/weather_daily_model.dart';
import 'package:weather_app/feature/model/weather_model.dart';
import 'package:weather_app/product/constants/api_key.dart';
import 'package:weather_app/product/enums/weather_api_keys.dart';
import 'package:weather_app/product/helper/show_alert_dialog.dart';

abstract class IWeatherService {
  IWeatherService(this.dio);
  final Dio dio;
  Future<Position> determinePosition();
  Future<WeatherModel?> getLocationDataByLatLon({required Position devicePosition});
  Future<List<List<WeatherDailyModel>>?> getDailyForecastByLocation({required BuildContext context, required String city});
  Future<List<List<WeatherDailyModel>>?> getDailyForecastByLatLon({required Position devicePosition});
  Future<WeatherModel?> getLocationDataByLocation({required BuildContext context, required String city});
}

class WeatherService extends IWeatherService {
  WeatherService(super.dio);

  // lat ve lon parametrelerine gore 5 gunluk verileri ceker
  @override
  Future<List<List<WeatherDailyModel>>?> getDailyForecastByLatLon({required Position devicePosition}) async {
    final response = await dio.get(
        '/${WeatherApiKeys.forecast.name}?lat=${devicePosition.latitude}&lon=${devicePosition.longitude}&lang=tr&appid=$apiKey&units=metric');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        final List<WeatherDailyModel> weatherItems = [];
        final List<WeatherDailyModel> hourlyItems = [];
        var dateNow = DateTime.now().day;
        for (var i = 7; i <= 39; i += 8) {
          weatherItems.add(WeatherDailyModel.fromJson(jsonBody, i));
        }
        for (var j = 0; j < 7; j++) {
          if (dateNow == DateTime.parse(jsonBody['list'][j]['dt_txt']).day) {
            hourlyItems.add(WeatherDailyModel.fromJson(jsonBody, j));
          }
        }
        return [hourlyItems, weatherItems];
      }
    }
    return null;
  }

  // city parametresine gore anlık lokasyonun 5 gunluk verilerini ceker
  @override
  Future<List<List<WeatherDailyModel>>?> getDailyForecastByLocation({required BuildContext context, required String city}) async {
    final response = await dio.get('/${WeatherApiKeys.forecast.name}?q=$city&lang=tr&appid=$apiKey&units=metric');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        final List<WeatherDailyModel> weatherItems = [];
        final List<WeatherDailyModel> hourlyItems = [];
        var dateNow = DateTime.now().day;
        for (var i = 7; i <= 39; i += 8) {
          weatherItems.add(WeatherDailyModel.fromJson(jsonBody, i));
        }
        for (var j = 0; j < 7; j++) {
          if (dateNow == DateTime.parse(jsonBody['list'][j]['dt_txt']).day) {
            hourlyItems.add(WeatherDailyModel.fromJson(jsonBody, j));
          }
        }
        return [hourlyItems, weatherItems];
      }
    }
    showAlerDialog(context: context, message: 'Lütfen geçerli bir lokasyon giriniz.');
    return null;
  }

  // lat ve lon parametrelerine gore anlık lokasyonun verilerini ceker
  @override
  Future<WeatherModel?> getLocationDataByLatLon({required Position devicePosition}) async {
    final response = await dio.get(
        '/${WeatherApiKeys.weather.name}?lat=${devicePosition.latitude}&lon=${devicePosition.longitude}&lang=tr&appid=$apiKey&units=metric');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return WeatherModel.fromJson(jsonBody);
      }
    }
    return null;
  }

// city parametresine gore anlık lokasyonun verilerini ceker
  @override
  Future<WeatherModel?> getLocationDataByLocation({required BuildContext context, required String city}) async {
    final response = await dio.get('/${WeatherApiKeys.weather.name}?q=$city&lang=tr&appid=$apiKey&units=metric');
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return WeatherModel.fromJson(jsonBody);
      }
    }
    showAlerDialog(context: context, message: 'Lütfen geçerli bir lokasyon giriniz.');
    return null;
  }

// konum izni
  @override
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }
}
