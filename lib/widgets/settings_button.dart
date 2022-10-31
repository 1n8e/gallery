import 'package:flutter/material.dart';
import 'package:test_project/ui/settings_screen/settings_screen.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Theme.of(context).primaryColor,
      icon: const Icon(Icons.settings),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const SettingsScreen(),
          ),
        );
      },
    );
  }
}
