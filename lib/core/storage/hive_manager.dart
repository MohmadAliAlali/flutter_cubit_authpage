import 'package:hive_flutter/hive_flutter.dart';
import 'boxes.dart';

class HiveManager {
  static Future<void> init() async {
    await Hive.initFlutter();

    await Hive.openBox(HiveBoxes.userBox);
    await Hive.openBox(HiveBoxes.medicationBox);
    await Hive.openBox(HiveBoxes.reportsBox);
    await Hive.openBox(HiveBoxes.userSettingsBox);
  }

  static Box getBox(String boxName) => Hive.box(boxName);
}
