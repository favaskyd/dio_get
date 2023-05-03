// To parse this JSON data, do
//
//     final dogs = dogsFromJson(jsonString);

import 'dart:convert';

Dogs dogsFromJson(String str) => Dogs.fromJson(json.decode(str));

String dogsToJson(Dogs data) => json.encode(data.toJson());

class Dogs {
  Dogs({
    required this.message,
    required this.status,
  });

  String message;
  String status;

  factory Dogs.fromJson(Map<String, dynamic> json) => Dogs(
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
  };
}
