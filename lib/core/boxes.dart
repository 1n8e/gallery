import 'package:hive_flutter/hive_flutter.dart';

mixin HiveBoxes {
  static Box get theme => Hive.box('theme');

  static Future<void> initHive() async {
    await Future.wait([
      Hive.openBox('theme'),
    ]);
  }
}