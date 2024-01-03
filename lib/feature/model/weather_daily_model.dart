class WeatherDailyModel {
  dynamic temperature;
  dynamic wind;
  String? date;
  String? description;
  String? icon;

  WeatherDailyModel({
    this.temperature,
    this.wind,
    this.description,
    this.date,
    this.icon,
  });

  WeatherDailyModel copyWith({
    dynamic temperature,
    dynamic wind,
    String? description,
    String? date,
    String? icon,
  }) {
    return WeatherDailyModel(
      temperature: temperature ?? this.temperature,
      wind: wind ?? this.wind,
      description: description ?? this.description,
      date: date ?? this.date,
      icon: icon ?? this.icon,
    );
  }

  factory WeatherDailyModel.fromJson(Map<String, dynamic> json, int index) {
    if (index == 7) {
      return WeatherDailyModel(
        temperature: json['list'][index]['main']['temp'],
        wind: json['list'][index]['wind']['speed'],
        description: json['list'][index]['weather'][0]['description'],
        date: 'Yarın',
        icon: json['list'][index]['weather'][0]['icon'],
      );
    }
    return WeatherDailyModel(
      temperature: json['list'][index]['main']['temp'],
      wind: json['list'][index]['main']['temp'],
      description: json['list'][index]['weather'][0]['description'],
      date: json['list'][index]['dt_txt'],
      icon: json['list'][index]['weather'][0]['icon'],
    );
  }
}
