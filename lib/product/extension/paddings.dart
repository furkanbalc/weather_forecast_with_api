import 'package:flutter/material.dart';
import 'package:weather_app/product/enums/paddings.dart';

extension CustomPaddingsExtension on BuildContext {
  CustomPaddings get paddings => CustomPaddings(this);
}

class CustomPaddings {
  final BuildContext context;
  CustomPaddings(this.context);

  EdgeInsets get zero => EdgeInsets.zero;
  EdgeInsets get allLow => EdgeInsets.all(Paddings.low.value);
  EdgeInsets get allMed => EdgeInsets.all(Paddings.med.value);
  EdgeInsets get allHigh => EdgeInsets.all(Paddings.high.value);
  EdgeInsets get allUltra => EdgeInsets.all(Paddings.ultra.value);

  // -- only top padding
  EdgeInsets get onlyTopLow => EdgeInsets.only(top: Paddings.low.value);
  EdgeInsets get onlyTopMed => EdgeInsets.only(top: Paddings.med.value);
  EdgeInsets get onlyTopigh => EdgeInsets.only(top: Paddings.high.value);
  EdgeInsets get onlyTopUltra => EdgeInsets.only(top: Paddings.ultra.value);

  // -- only bottom padding
  EdgeInsets get onlyBottomLow => EdgeInsets.only(bottom: Paddings.low.value);
  EdgeInsets get onlyBottomMed => EdgeInsets.only(bottom: Paddings.med.value);
  EdgeInsets get onlyBottomHigh => EdgeInsets.only(bottom: Paddings.high.value);
  EdgeInsets get onlyBottomUltra => EdgeInsets.only(bottom: Paddings.ultra.value);

  // -- verical padding
  EdgeInsets get verticalLow => EdgeInsets.symmetric(vertical: Paddings.low.value);
  EdgeInsets get verticalMed => EdgeInsets.symmetric(vertical: Paddings.med.value);
  EdgeInsets get verticalHigh => EdgeInsets.symmetric(vertical: Paddings.high.value);
  EdgeInsets get verticalUltra => EdgeInsets.symmetric(vertical: Paddings.ultra.value);

  // -- horizontal padding
  EdgeInsets get horizontalLow => EdgeInsets.symmetric(horizontal: Paddings.low.value);
  EdgeInsets get horizontalMed => EdgeInsets.symmetric(horizontal: Paddings.med.value);
  EdgeInsets get horizontalHigh => EdgeInsets.symmetric(horizontal: Paddings.high.value);
  EdgeInsets get horizontalUltra => EdgeInsets.symmetric(horizontal: Paddings.ultra.value);
}
