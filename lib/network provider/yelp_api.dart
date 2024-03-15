import 'package:mongo_dart/mongo_dart.dart';
import 'package:yelp/constant/mongodb_connections.dart';

class BusinessService {
  static final String connectionString = MongodbConnections.url;
  static final String collectionName = MongodbConnections.businessCollection;

  BusinessService();

  static Future<Db> _openDatabaseConnection() async {
    final db = await Db.create(connectionString);
    await db.open();
    return db;
  }

  static Future<List<Map<String, dynamic>>> fetchFirst5Businesses() async {
    final db = await _openDatabaseConnection();
    var collection = db.collection(collectionName);

    // Find the first 5 documents
    var cursor = await collection.find().take(5).toList();

    await db.close();

    return cursor;
  }
}

main() async {
  final dynamic test = await BusinessService.fetchFirst5Businesses();
  print(test);
}
