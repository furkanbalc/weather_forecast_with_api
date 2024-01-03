class WeatherModel {
  String? city;
  String? country;
  String? forecast;
  String? icon;
  dynamic temp;
  dynamic tempMin;
  dynamic tempMax;
  dynamic tempFeels;
  dynamic wind;
  dynamic humidity;
  dynamic pressure;

  WeatherModel({
    this.city,
    this.country,
    this.forecast,
    this.icon,
    this.temp,
    this.tempMin,
    this.tempMax,
    this.tempFeels,
    this.wind,
    this.humidity,
    this.pressure,
  });

  WeatherModel copyWith({
    String? city,
    String? country,
    String? forecast,
    String? icon,
    dynamic temp,
    dynamic tempMin,
    dynamic tempMax,
    dynamic tempFeels,
    dynamic wind,
    dynamic humidity,
    dynamic pressure,
  }) {
    return WeatherModel(
      city: city ?? this.city,
      country: country ?? this.country,
      forecast: forecast ?? this.forecast,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      tempFeels: tempFeels ?? this.tempFeels,
      wind: wind ?? this.wind,
      humidity: humidity ?? this.humidity,
      pressure: pressure ?? this.pressure,
    );
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['name'],
      country: json['sys']['country'],
      forecast: json['weather'].first['description'],
      icon: json['weather'].first['icon'],
      temp: json['main']['temp'],
      tempMin: json['main']['temp_min'],
      tempMax: json['main']['temp_max'],
      tempFeels: json['main']['feels_like'],
      wind: json['wind']['speed'],
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
    );
  }
}
