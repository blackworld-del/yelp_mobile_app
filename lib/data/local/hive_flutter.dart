import 'package:hive/hive.dart';

class HiveHelper {
  static const String _boxName = 'businesses';

  static Future<void> saveBusiness(String name) async {
    final box = await Hive.openBox(_boxName);
    await box.add(name);
  }

  static Future<List<String>> getSavedBusinesses() async {
    final box = await Hive.openBox(_boxName);
    return List<String>.from(box.values);
  }
}
