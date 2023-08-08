import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var db, userCollection, error;

  static connect() async {
    db = await Db.create("mongodb://" +
        "mdodik" +
        ":" +
        "zavrsniDodik2021" +
        "@" +
        "161.53.19.140" + //ip
        ":" +
        "56568" + //port
        "/marko_dodik" + //collection name
        "?authSource=admin"); //query
    await db.open();
    userCollection = db.collection("passenger_data");
  }

  static Future<List<Map<String, dynamic>>> getDocuments() async {
    try {
      final users = await userCollection.find().toList();
      return users;
    } catch (e) {
      print(e);
      return Future.value(error);
    }
  }

  static insert(Map<String, dynamic> flag) async {
    await userCollection.insert(flag);
    return true;
  }

  static closeConnection() {
    db.close();
  }
}
