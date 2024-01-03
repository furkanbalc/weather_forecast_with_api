import 'package:flutter/material.dart';
import 'package:weather_app/product/constants/app_colors.dart';
import 'package:weather_app/product/utility/box_decoration.dart';

class BaseScaffold extends StatefulWidget {
  const BaseScaffold({super.key, this.child, this.resizeToAvoidBottomInset, this.fabButton, this.appBarTitle});
  final Widget? child;
  final Widget? appBarTitle;
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
      appBar: AppBar(
        backgroundColor: AppColors.fiantingLight,
        title: widget.appBarTitle,
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecorations.backgroundDecoration,
        child: widget.child,
      ),
      floatingActionButton: widget.fabButton,
    );
  }
}
