import 'dart:convert';

class GetMessageModel {
  final int? code;
  final String? status;
  final String? message;
  final Data? data;

  GetMessageModel({
    this.code,
    this.status,
    this.message,
    this.data,
  });

  factory GetMessageModel.fromJson(String str) =>
      GetMessageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetMessageModel.fromMap(Map<String, dynamic> json) => GetMessageModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  final User? user;
  final String? url;
  final Schedule? schedule;

  Data({
    this.user,
    this.url,
    this.schedule,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        url: json["url"],
        schedule: json["schedule"] == null
            ? null
            : Schedule.fromMap(json["schedule"]),
      );

  Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
        "url": url,
        "schedule": schedule?.toMap(),
      };
}

class Schedule {
  final Day? monday;
  final Day? tuesday;
  final Day? wednesday;
  final Day? thursday;
  final Day? friday;
  final Day? saturday;
  final Day? sunday;

  Schedule({
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  factory Schedule.fromJson(String str) => Schedule.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Schedule.fromMap(Map<String, dynamic> json) => Schedule(
        monday: json["monday"] == null ? null : Day.fromMap(json["monday"]),
        tuesday: json["tuesday"] == null ? null : Day.fromMap(json["tuesday"]),
        wednesday:
            json["wednesday"] == null ? null : Day.fromMap(json["wednesday"]),
        thursday:
            json["thursday"] == null ? null : Day.fromMap(json["thursday"]),
        friday: json["friday"] == null ? null : Day.fromMap(json["friday"]),
        saturday:
            json["saturday"] == null ? null : Day.fromMap(json["saturday"]),
        sunday: json["sunday"] == null ? null : Day.fromMap(json["sunday"]),
      );

  Map<String, dynamic> toMap() => {
        "monday": monday?.toMap(),
        "tuesday": tuesday?.toMap(),
        "wednesday": wednesday?.toMap(),
        "thursday": thursday?.toMap(),
        "friday": friday?.toMap(),
        "saturday": saturday?.toMap(),
        "sunday": sunday?.toMap(),
      };
}

class Day {
  final String? start;
  final String? finish;

  Day({
    this.start,
    this.finish,
  });

  factory Day.fromJson(String str) => Day.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Day.fromMap(Map<String, dynamic> json) => Day(
        start: json["start"],
        finish: json["finish"],
      );

  Map<String, dynamic> toMap() => {
        "start": start,
        "finish": finish,
      };
}

class User {
  final int? id;
  final String? name;
  final String? message;
  final String? imei;
  final bool? pro;
  final String? proExpires;
  final String? created;
  final bool? validated;

  User({
    this.id,
    this.name,
    this.message,
    this.imei,
    this.pro,
    this.proExpires,
    this.created,
    this.validated,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        message: json["message"],
        imei: json["imei"],
        pro: json["pro"],
        proExpires: json["pro_expires"],
        created: json["created"],
        validated: json["validated"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "message": message,
        "imei": imei,
        "pro": pro,
        "pro_expires": proExpires,
        "created": created,
        "validated": validated,
      };
}
