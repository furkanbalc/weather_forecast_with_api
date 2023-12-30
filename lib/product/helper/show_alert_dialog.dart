import 'package:flutter/material.dart';
import 'package:weather_app/product/constants/app_colors.dart';
import 'package:weather_app/product/constants/app_strings.dart';

showAlerDialog({
  required BuildContext context,
  required String message,
  bool? barrierDismissible,
  String? btnText,
  Widget? route,
}) {
  return showDialog(
    barrierDismissible: barrierDismissible ?? true,
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(message, style: Theme.of(context).textTheme.titleMedium),
        actions: [
          TextButton(
            onPressed: () {
              route == null
                  ? Navigator.of(context).pop()
                  : Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => route));
            },
            child: Text(
              btnText ?? AppStrings.kContinue,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.fiantingLight),
            ),
          ),
        ],
      );
    },
  );
}
