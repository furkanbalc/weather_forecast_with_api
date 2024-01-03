import 'package:flutter/material.dart';
import 'package:weather_app/product/constants/app_colors.dart';

showLoadingDialog({required BuildContext context}) async {
  return await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Center(child: CircularProgressIndicator(color: AppColors.blueGem)),
                const SizedBox(width: 20),
                Expanded(child: Text('Yükleniyor', style: Theme.of(context).textTheme.titleMedium)),
              ],
            ),
          ],
        ),
      );
    },
  );
}
