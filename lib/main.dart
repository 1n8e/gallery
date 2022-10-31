import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_project/bloc/theme_cubit/theme_cubit.dart';
import 'package:test_project/core/injections.dart';
import 'package:test_project/ui/main_screen.dart';

void main() {
  Hive.initFlutter();
  setupInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: state.theme,
            title: 'Material App',
            home: MainScreen(),
          );
        },
      ),
    );
  }
}
