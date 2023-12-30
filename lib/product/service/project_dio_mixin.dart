import 'package:dio/dio.dart';

const String baseUrl = 'https://api.openweathermap.org/data/2.5/';

// her seferinde dio instance olusturmak yerine mixin seklinde kullanmayı tercih ettim
mixin ProjectDioMixin {
  final service = Dio(BaseOptions(baseUrl: baseUrl));
}
