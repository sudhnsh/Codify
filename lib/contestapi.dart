// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';
import 'package:http/http.dart' as http;

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    this.status,
    this.result,
  });

  String status;
  List<Result> result;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        status: json["status"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.name,
    this.type,
    this.phase,
    this.frozen,
    this.durationSeconds,
    this.startTimeSeconds,
    this.relativeTimeSeconds,
  });

  int id;
  String name;
  Type type;
  Phase phase;
  bool frozen;
  int durationSeconds;
  int startTimeSeconds;
  int relativeTimeSeconds;
  int days;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        type: typeValues.map[json["type"]],
        phase: phaseValues.map[json["phase"]],
        frozen: json["frozen"],
        durationSeconds: json["durationSeconds"],
        startTimeSeconds: json["startTimeSeconds"],
        relativeTimeSeconds: json["relativeTimeSeconds"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": typeValues.reverse[type],
        "phase": phaseValues.reverse[phase],
        "frozen": frozen,
        "durationSeconds": durationSeconds,
        "startTimeSeconds": startTimeSeconds,
        "relativeTimeSeconds": relativeTimeSeconds,
      };
}

enum Phase { BEFORE }

final phaseValues = EnumValues({
  "BEFORE": Phase.BEFORE,
});

enum Type { CF, ICPC, IOI }

final typeValues =
    EnumValues({"CF": Type.CF, "ICPC": Type.ICPC, "IOI": Type.IOI});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

class ContestManager {
  final Uri userName;
  ContestManager(this.userName);

  Future<Users> getUserDetails() async {
    final result = await http.get(userName);
    if (result.statusCode == 200) {
      return Users.fromJson(json.decode(result.body));
    } else
      throw Exception('Failed');
  }
}
