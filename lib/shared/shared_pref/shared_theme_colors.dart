import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManageLastThemeColor {
   List<MaterialColor> materialColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.indigo,
    Colors.lime,
    Colors.amber,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
    Colors.deepOrange,
    Colors.deepPurple,

  ];

   Map<String, MaterialColor> colorMap = {
    'red': Colors.red,
    'blue': Colors.blue,
    'green': Colors.green,
    'yellow': Colors.yellow,
    'purple': Colors.purple,
    'orange': Colors.orange,
    'pink': Colors.pink,
    'teal': Colors.teal,
    'cyan': Colors.cyan,
    'indigo': Colors.indigo,
    'lime': Colors.lime,
    'amber': Colors.amber,
    'brown': Colors.brown,
    'grey': Colors.grey,
    'blueGrey': Colors.blueGrey,
    'deepOrange': Colors.deepOrange,
    'deepPurple': Colors.deepPurple,
  };

   Future<MaterialColor> loadLastThemeColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? color = prefs.getString('themeColor');
    MaterialColor materialColor = colorMap[color] ?? Colors.cyan;

    return materialColor;
  }

   Future<void> saveLastThemeColor(MaterialColor materialColor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String correspondingMaterialColor = colorMap.keys.firstWhere((element) => colorMap[element] == materialColor);

    prefs.setString('themeColor', correspondingMaterialColor);


  }

   MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }
}