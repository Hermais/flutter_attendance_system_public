import 'package:flutter/material.dart';

class AppBarFlexibleSpace extends StatelessWidget {
  final MaterialColor primarySwatchAppColor;
  final Function? onColorChange;

   const AppBarFlexibleSpace(
      {Key? key, required this.primarySwatchAppColor, this.onColorChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
          boxShadow: [
            BoxShadow(
              color: primarySwatchAppColor,
              offset: const Offset(0, 10),
              blurRadius: 20,
              spreadRadius: -5,
            ),
          ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                primarySwatchAppColor[200]!,
                primarySwatchAppColor[300]!,
                primarySwatchAppColor[500]!,
                primarySwatchAppColor[500]!,
              ],
              stops: const [
                0.1,
                0.3,
                0.9,
                1.0
              ])),
    );
  }
}
