enum AppLotties {
  windy('windy'),
  humidity('humidity'),
  pressure('pressure'),
  temp('temp'),
  ;

  final String value;
  const AppLotties(this.value);

  String get toLottie => 'assets/lotties/lottie_$value.json';
}
