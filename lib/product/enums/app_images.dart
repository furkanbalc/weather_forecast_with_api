enum AppImages {
  rainy('rainy'),
  ;

  final String value;
  const AppImages(this.value);

  String get toImage => 'assets/images/ic_$value.png';
}
