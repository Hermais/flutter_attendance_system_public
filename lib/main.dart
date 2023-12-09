// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_nullable_for_final_variable_declarations, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/theme_change_manager_cubit.dart';
import 'package:flutter_attendance_system/shared/constants_and_statics/shared_vars.dart';
import 'package:flutter_attendance_system/shared/shared_pref/shared_theme_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_router.dart';
import 'features/widgets/app_bar_flexible_space.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  MaterialColor primarySwatchColor =
      (await ManageLastThemeColor().loadLastThemeColor());
  runApp(
    MainApp(
      primarySwatchAppColor: primarySwatchColor,
    ),
  );
}

class MainApp extends StatefulWidget {
  MaterialColor primarySwatchAppColor;

  MainApp({Key? key, required this.primarySwatchAppColor}) : super(key: key);

  @override
  State<MainApp> createState() => MainAppState();
}

class MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    /// Provides the app with the theme change manager cubit, but only up to LoginPage().
    return BlocProvider(
      /// Here, we are providing the cubit with the initial state.
      create: (context) => ThemeChangeManagerCubit(
        primarySwatchAppColor: widget.primarySwatchAppColor,
        appBarFlexibleSpace: AppBarFlexibleSpace(
          primarySwatchAppColor: widget.primarySwatchAppColor,
        ),
      ),
      /// Here, we are providing the app with the theme change manager cubit.
      child: BlocBuilder<ThemeChangeManagerCubit, ThemeChangeManagerState>(
        builder: (context, state) {
          return MaterialApp(
            initialRoute: '/',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: state.primarySwatchAppColor,
              primarySwatch: state.primarySwatchAppColor,

              textTheme: appTextTheme,
              appBarTheme: AppBarTheme(
                backgroundColor: state.primarySwatchAppColor,
                elevation: 14,
                shadowColor: state.primarySwatchAppColor[900],
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
              ),
            ),
            onGenerateRoute: AppRouter().onGenerateRoute,
          );
        },
      ),
    );
  }
}
