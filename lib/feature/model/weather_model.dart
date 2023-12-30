class WeatherModel {
  double? temprature;
  double? wind;
  String? city;
  String? forecast;
  String? icon;

  WeatherModel({
    this.temprature,
    this.wind,
    this.city,
    this.forecast,
    this.icon,
  });

  WeatherModel copyWith({
    double? temprature,
    double? wind,
    String? city,
    String? forecast,
    String? icon,
  }) {
    return WeatherModel(
      temprature: temprature ?? this.temprature,
      wind: wind ?? this.wind,
      city: city ?? this.city,
      forecast: forecast ?? this.forecast,
      icon: icon ?? this.icon,
    );
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temprature: json['main']['temp'] as double?,
      wind: json['wind']['speed'] as double?,
      city: json['name'] as String?,
      forecast: json['weather'].first['description'] as String?,
      icon: json['weather'].first['icon'] as String?,
    );
  }
}
