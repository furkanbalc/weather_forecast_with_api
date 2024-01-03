import 'package:flutter/material.dart';
import 'package:weather_app/product/extension/index.dart';

class WeatherDetailCard extends StatelessWidget {
  const WeatherDetailCard({
    super.key,
    required this.child,
    required this.decoration,
  });
  final Widget child;
  final BoxDecoration decoration;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 10,
      child: Container(
        padding: context.paddings.allLow,
        width: MediaQuery.sizeOf(context).width,
        decoration: decoration,
        child: Padding(
          padding: context.paddings.verticalLow,
          child: child,
        ),
      ),
    );
  }
}
