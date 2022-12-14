import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:test_project/core/theme.dart';
import 'package:test_project/services/settings_service.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(isDarkThemeOn: SettingService.theme));

  void toggleSwitch(bool value) => emit(state.copyWith(changeState: value));

}
