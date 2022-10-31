import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_project/core/boxes.dart';

mixin SettingService {
  static Box get _box => HiveBoxes.theme;

  static bool get theme => _box.get('theme', defaultValue: true);

  static set theme(bool v) => _box.put('theme', v);
}