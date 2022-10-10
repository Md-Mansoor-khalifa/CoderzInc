import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

EventModel eventModelFromJson(String str) =>
    EventModel.fromJson(json.decode(str));

String eventModelToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
  EventModel(
      {required this.id,
      required this.empId,
      required this.eventTitle,
      required this.eventDescription,
      required this.eventType,
      required this.duration,
      required this.day,
      required this.email});

  ObjectId id;
  String empId;
  String eventTitle;
  String eventDescription;
  String eventType;
  String duration;
  String day;
  String email;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
      id: json["_id"],
      empId: json["empId"],
      eventTitle: json["eventTitle"],
      eventDescription: json["eventDescription"],
      eventType: json["eventType"],
      duration: json["duration"],
      day: json["day"],
      email: json["email"]);

  Map<String, dynamic> toJson() => {
        "_id": id,
        "empId": empId,
        "eventTitle": eventTitle,
        "eventType": eventType,
        "eventDescription": eventDescription,
        "duration": duration,
        "day": day,
        "email": email
      };
}
