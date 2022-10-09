import 'dart:developer';

import 'package:coderz_inc/EmployeeModel.dart';
import 'package:coderz_inc/dbHelper/constant.dart';
import 'package:coderz_inc/utils/EventModel.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var db, userCollection, eventCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
    eventCollection = db.collection("events");
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final arrData = await userCollection.find().toList();
    return arrData;
  }

  static Future<String> insert(MongoDbModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data Inserted";
      } else {
        return "Something Wrong while inserting data. ";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }

  static Future<String> insertEvent(EventModel data) async {
    try {
      var result = await eventCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data Inserted";
      } else {
        return "Something Wrong while inserting data. ";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
