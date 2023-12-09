import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../features/widgets/app_bar_flexible_space.dart';

part 'theme_change_manager_state.dart';

class ThemeChangeManagerCubit extends Cubit<ThemeChangeManagerState> {
  MaterialColor primarySwatchAppColor;
  AppBarFlexibleSpace appBarFlexibleSpace;

  ThemeChangeManagerCubit(
      {required this.primarySwatchAppColor, required this.appBarFlexibleSpace})
      : super(ThemeChangeManagerInitial(primarySwatchAppColor: primarySwatchAppColor));

  void changeTheme(MaterialColor materialColor) {
    emit(ThemeChangeManagerChanged(primarySwatchAppColor: materialColor));
  }
}
