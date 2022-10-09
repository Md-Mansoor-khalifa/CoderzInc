import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) =>
    MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
  MongoDbModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.department,
    required this.joiningDate,
  });

  ObjectId id;
  String name;
  String phoneNumber;
  String email;
  String department;
  String joiningDate;

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
        id: json["_id"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        department: json["department"],
        joiningDate: json["joiningDate"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "phoneNumber": phoneNumber,
        "email": email,
        "department": department,
        "joiningDate": joiningDate,
      };
}
