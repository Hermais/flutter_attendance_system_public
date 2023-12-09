part of 'theme_change_manager_cubit.dart';

@immutable
abstract class ThemeChangeManagerState {
  final MaterialColor primarySwatchAppColor;
  final AppBarFlexibleSpace appBarFlexibleSpace ;

  const ThemeChangeManagerState({required this.primarySwatchAppColor, required this.appBarFlexibleSpace});
}

class ThemeChangeManagerInitial extends ThemeChangeManagerState {
  ThemeChangeManagerInitial({required MaterialColor primarySwatchAppColor}) : super(primarySwatchAppColor: primarySwatchAppColor, appBarFlexibleSpace: AppBarFlexibleSpace(primarySwatchAppColor: primarySwatchAppColor));

}

class ThemeChangeManagerChanged extends ThemeChangeManagerState {
  ThemeChangeManagerChanged({required MaterialColor primarySwatchAppColor}) : super(primarySwatchAppColor: primarySwatchAppColor, appBarFlexibleSpace: AppBarFlexibleSpace(primarySwatchAppColor: primarySwatchAppColor));
}
