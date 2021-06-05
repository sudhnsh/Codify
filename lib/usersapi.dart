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
    this.lastName,
    this.country,
    this.lastOnlineTimeSeconds,
    this.city,
    this.rating,
    this.friendOfCount,
    this.titlePhoto,
    this.handle,
    this.avatar,
    this.firstName,
    this.contribution,
    this.organization,
    this.rank,
    this.maxRating,
    this.registrationTimeSeconds,
    this.maxRank,
  });

  String lastName;
  String country;
  int lastOnlineTimeSeconds;
  String city;
  int rating;
  int friendOfCount;
  String titlePhoto;
  String handle;
  String avatar;
  String firstName;
  int contribution;
  String organization;
  String rank;
  int maxRating;
  int registrationTimeSeconds;
  String maxRank;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        lastName: json["lastName"],
        country: json["country"],
        lastOnlineTimeSeconds: json["lastOnlineTimeSeconds"],
        city: json["city"],
        rating: json["rating"],
        friendOfCount: json["friendOfCount"],
        titlePhoto: json["titlePhoto"],
        handle: json["handle"],
        avatar: json["avatar"],
        firstName: json["firstName"],
        contribution: json["contribution"],
        organization: json["organization"],
        rank: json["rank"],
        maxRating: json["maxRating"],
        registrationTimeSeconds: json["registrationTimeSeconds"],
        maxRank: json["maxRank"],
      );

  Map<String, dynamic> toJson() => {
        "lastName": lastName,
        "country": country,
        "lastOnlineTimeSeconds": lastOnlineTimeSeconds,
        "city": city,
        "rating": rating,
        "friendOfCount": friendOfCount,
        "titlePhoto": titlePhoto,
        "handle": handle,
        "avatar": avatar,
        "firstName": firstName,
        "contribution": contribution,
        "organization": organization,
        "rank": rank,
        "maxRating": maxRating,
        "registrationTimeSeconds": registrationTimeSeconds,
        "maxRank": maxRank,
      };
}

class UserManager {
  final Uri userName;
  UserManager(this.userName);

  Future<Users> getUserDetails() async {
    final result = await http.get(userName);
    if (result.statusCode == 200) {
      return Users.fromJson(json.decode(result.body));
    } else
      throw Exception('Failed');
  }
}
