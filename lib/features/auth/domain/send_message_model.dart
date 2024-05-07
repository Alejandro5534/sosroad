import 'dart:convert';

class SendMessageModel {
  final int code;
  final String status;
  final String message;
  final Data data;

  SendMessageModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  factory SendMessageModel.fromJson(String str) =>
      SendMessageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SendMessageModel.fromMap(Map<String, dynamic> json) =>
      SendMessageModel(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "status": status,
        "message": message,
        "data": data.toMap(),
      };
}

class Data {
  final User user;
  final String url;
  final Schedule schedule;

  Data({
    required this.user,
    required this.url,
    required this.schedule,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        user: User.fromMap(json["user"]),
        url: json["url"],
        schedule: Schedule.fromMap(json["schedule"]),
      );

  Map<String, dynamic> toMap() => {
        "user": user.toMap(),
        "url": url,
        "schedule": schedule.toMap(),
      };
}

class Schedule {
  final Day monday;
  final Day tuesday;
  final Day wednesday;
  final Day thursday;
  final Day friday;
  final Day saturday;
  final Day sunday;

  Schedule({
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  factory Schedule.fromJson(String str) => Schedule.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Schedule.fromMap(Map<String, dynamic> json) => Schedule(
        monday: Day.fromMap(json["monday"]),
        tuesday: Day.fromMap(json["tuesday"]),
        wednesday: Day.fromMap(json["wednesday"]),
        thursday: Day.fromMap(json["thursday"]),
        friday: Day.fromMap(json["friday"]),
        saturday: Day.fromMap(json["saturday"]),
        sunday: Day.fromMap(json["sunday"]),
      );

  Map<String, dynamic> toMap() => {
        "monday": monday.toMap(),
        "tuesday": tuesday.toMap(),
        "wednesday": wednesday.toMap(),
        "thursday": thursday.toMap(),
        "friday": friday.toMap(),
        "saturday": saturday.toMap(),
        "sunday": sunday.toMap(),
      };
}

class Day {
  final String start;
  final String finish;

  Day({
    required this.start,
    required this.finish,
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
  final int id;
  final String name;
  final String message;
  final String imei;
  final bool pro;
  final String proExpires;
  final String created;
  final bool validated;

  User({
    required this.id,
    required this.name,
    required this.message,
    required this.imei,
    required this.pro,
    required this.proExpires,
    required this.created,
    required this.validated,
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
