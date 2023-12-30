import 'package:flutter/material.dart';
import 'package:weather_app/product/constants/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: CircularProgressIndicator(color: AppColors.goldenSamowar),
      ),
    );
  }
}
