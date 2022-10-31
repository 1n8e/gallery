import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/bloc/theme_cubit/theme_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).bottomAppBarColor,
            elevation: 0,
          ),
          body: Container(
            margin: const EdgeInsets.all(16),
            width: double.maxFinite,
            height: 300,
            decoration: BoxDecoration(
              color: Theme.of(context).bottomAppBarColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                              elevation: 10,
                              backgroundColor: const Color(0xff2c2c2e),
                              title: SizedBox(
                                width: 343,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        context
                                            .read<ThemeCubit>()
                                            .toggleSwitch(true);
                                      },
                                      child: Text('Светлая тема'),
                                    ),
                                    const Divider(
                                      color: Colors.grey,
                                      thickness: 1.5,
                                      height: 0,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        BlocProvider.of<ThemeCubit>(context).toggleSwitch(false);
                                      },
                                      child: const Text('Темная тема'),
                                    ),
                                  ],
                                ),
                              ),
                            ));
                  },
                  child: Container(
                    width: double.maxFinite,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Тема',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                const Divider(color: Colors.grey, thickness: 1.5, height: 0),
              ],
            ),
          ),
        );
      },
    );
  }
}
