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
    this.contestId,
    this.contestName,
    this.rank,
    this.ratingUpdateTimeSeconds,
    this.oldRating,
    this.newRating,
  });

  int contestId;
  String contestName;
  int rank;
  int ratingUpdateTimeSeconds;
  int oldRating;
  int newRating;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        contestId: json["contestId"],
        contestName: json["contestName"],
        rank: json["rank"],
        ratingUpdateTimeSeconds: json["ratingUpdateTimeSeconds"],
        oldRating: json["oldRating"],
        newRating: json["newRating"],
      );

  Map<String, dynamic> toJson() => {
        "contestId": contestId,
        "contestName": contestName,
        "rank": rank,
        "ratingUpdateTimeSeconds": ratingUpdateTimeSeconds,
        "oldRating": oldRating,
        "newRating": newRating,
      };
}

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

class RatingManager {
  final Uri userName;
  RatingManager(this.userName);

  Future<Users> getUserDetails() async {
    final result = await http.get(userName);
    if (result.statusCode == 200) {
      return Users.fromJson(json.decode(result.body));
    } else
      throw Exception('Failed');
  }
}
