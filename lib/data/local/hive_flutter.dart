import 'package:path_provider/path_provider.dart'; // Import path_provider package
import 'package:hive/hive.dart';

class HiveHelper {
  static const String _boxName = 'businesses';

  // Initialize Hive and open box
  static Future<void> initHive() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
  }

  static Future<void> saveBusiness(String name) async {
    await Hive.openBox(_boxName); // Open box after Hive is initialized
    final box = Hive.box(_boxName);
    await box.add(name);
  }

  static Future<List<String>> getSavedBusinesses() async {
    await Hive.openBox(_boxName); // Open box after Hive is initialized
    final box = Hive.box(_boxName);
    return List<String>.from(box.values);
  }
}
