// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_nullable_for_final_variable_declarations, must_be_immutable

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_attendance_system/core/cubits/internet_cubit.dart';
import 'package:flutter_attendance_system/core/cubits/theme_change_manager_cubit.dart';
import 'package:flutter_attendance_system/shared/constants_and_statics/shared_vars.dart';
import 'package:flutter_attendance_system/shared/shared_pref/shared_theme_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion/motion.dart';

import 'app_router.dart';
import 'core/cubits/auth_cubit.dart';
import 'core/data/repositories/auth_repository.dart';
import 'core/data/services/auth_web_services.dart';
import 'features/widgets/app_bar_flexible_space.dart';


AuthCubit authCubit = AuthCubit(
    authRepository: AuthRepository(authWebServices: AuthWebServices()));

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Motion.instance.initialize();
  MaterialColor primarySwatchColor =
  (await ManageLastThemeColor().loadLastThemeColor());
  runApp(
    MainApp(
      primarySwatchAppColor: primarySwatchColor,
    ),
  );
}

void customPrint(String message) {
  print(
      '\n\n\n\n\n\n\n\n\n***************************************************************'
          '\n$message\n\n\n\n\n\n\n\n\n***************************************************************\n\n\n\n\n\n\n\n\n');
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(

          /// Here, we are providing the cubit with the initial state.
          create: (context) =>
              ThemeChangeManagerCubit(
                primarySwatchAppColor: widget.primarySwatchAppColor,
                appBarFlexibleSpace: AppBarFlexibleSpace(
                  primarySwatchAppColor: widget.primarySwatchAppColor,
                ),
              ),

          /// Here, we are providing the app with the theme change manager cubit.
        ),
        BlocProvider(
          create: (context) => InternetCubit(connectivity: Connectivity()),
        ),
        BlocProvider(
          create: (context) => authCubit,
        ),
      ],
      child: BlocBuilder<ThemeChangeManagerCubit, ThemeChangeManagerState>(
        builder: (context, state) {
          return MaterialApp(
            initialRoute: '/',
            debugShowCheckedModeBanner: false,

            theme: ThemeData(
              // useMaterial3: false,
              primaryColor: state.primarySwatchAppColor,

              textTheme: appTextTheme,
              appBarTheme: AppBarTheme(
                backgroundColor: state.primarySwatchAppColor.withAlpha(50),

              ),
            ),
            onGenerateRoute: AppRouter().onGenerateRoute,
          );
        },
      ),
    );
  }
}
