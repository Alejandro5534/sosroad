import 'dart:convert';

class TokenModel {
  final int code;
  final String status;
  final String message;
  final Data data;

  TokenModel({
    required this.code,
    required this.status,
    required this.message,
    required this.data,
  });

  factory TokenModel.fromJson(String str) =>
      TokenModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TokenModel.fromMap(Map<String, dynamic> json) => TokenModel(
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
  final String authorized;

  Data({
    required this.authorized,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        authorized: json["Authorized"],
      );

  Map<String, dynamic> toMap() => {
        "Authorized": authorized,
      };
}
