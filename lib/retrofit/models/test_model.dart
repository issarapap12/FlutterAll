import 'dart:convert';

class TestModel {
  TestModel({
    this.code,
    this.message,
    this.user,
  });

  int code;
  String message;
  String user;

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        code: json["code"],
        message: json["message"],
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "user": user,
      };
}
