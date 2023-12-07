import 'package:flutter/material.dart';

class AppBarFlexibleSpace extends StatefulWidget {
  MaterialColor primarySwatchAppColor;
  final Function? onColorChange;

   AppBarFlexibleSpace(
      {Key? key, required this.primarySwatchAppColor, this.onColorChange})
      : super(key: key);

  @override
  State<AppBarFlexibleSpace> createState() => _AppBarFlexibleSpaceState();


}

class _AppBarFlexibleSpaceState extends State<AppBarFlexibleSpace> {
  @override
  void didUpdateWidget(covariant AppBarFlexibleSpace oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.primarySwatchAppColor != oldWidget.primarySwatchAppColor) {
      setState(() {});
    }
  }
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
              color: widget.primarySwatchAppColor,
              offset: const Offset(0, 10),
              blurRadius: 20,
              spreadRadius: -5,
            ),
          ],
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                widget.primarySwatchAppColor[200]!,
                widget.primarySwatchAppColor[300]!,
                widget.primarySwatchAppColor[500]!,
                widget.primarySwatchAppColor[500]!,
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
