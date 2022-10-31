part of 'theme_cubit.dart';


@immutable
class ThemeState {
  final bool isDarkThemeOn;
  late ThemeData theme;

  ThemeState({required this.isDarkThemeOn}) {
    if (isDarkThemeOn) {
      theme = appTheme[AppTheme.LightAppTheme]!;
    } else {
      theme = appTheme[AppTheme.DarkAppTheme]!;
    }
  }

  ThemeState copyWith({required bool changeState}) {
    return ThemeState(isDarkThemeOn: changeState);
  }
}
