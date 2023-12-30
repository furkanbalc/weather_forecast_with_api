enum AppLotties {
  windy('windy'),
  ;

  final String value;
  const AppLotties(this.value);

  String get toLottie => 'assets/lotties/lottie_$value.json';
}
