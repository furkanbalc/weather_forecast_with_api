import 'package:flutter/material.dart';
import 'package:weather_app/product/constants/app_colors.dart';
import 'package:weather_app/product/utility/box_decoration.dart';

class BaseScaffold extends StatefulWidget {
  const BaseScaffold({super.key, this.child, this.resizeToAvoidBottomInset, this.fabButton});
  final Widget? child;
  final Widget? fabButton;
  final bool? resizeToAvoidBottomInset;

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      appBar: AppBar(backgroundColor: AppColors.fiantingLight),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecorations.backgroundDecoration,
        child: widget.child,
      ),
      floatingActionButton: widget.fabButton,
    );
  }
}
