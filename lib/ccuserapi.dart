import 'dart:convert';
import 'package:http/http.dart' as http;

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    this.status,
    this.rating,
    this.stars,
    this.highestRating,
    this.globalRank,
    this.countryRank,
    this.userDetails,
    this.contests,
    this.contestRatings,
  });

  String status;
  int rating;
  String stars;
  int highestRating;
  int globalRank;
  int countryRank;
  UserDetails userDetails;
  List<Contest> contests;
  List<ContestRating> contestRatings;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        status: json["status"],
        rating: json["rating"],
        stars: json["stars"],
        highestRating: json["highest_rating"],
        globalRank: json["global_rank"],
        countryRank: json["country_rank"],
        userDetails: UserDetails.fromJson(json["user_details"]),
        contests: List<Contest>.from(
            json["contests"].map((x) => Contest.fromJson(x))),
        contestRatings: List<ContestRating>.from(
            json["contest_ratings"].map((x) => ContestRating.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "rating": rating,
        "stars": stars,
        "highest_rating": highestRating,
        "global_rank": globalRank,
        "country_rank": countryRank,
        "user_details": userDetails.toJson(),
        "contests": List<dynamic>.from(contests.map((x) => x.toJson())),
        "contest_ratings":
            List<dynamic>.from(contestRatings.map((x) => x.toJson())),
      };
}

class ContestRating {
  ContestRating({
    this.code,
    this.getyear,
    this.getmonth,
    this.getday,
    this.reason,
    this.penalisedIn,
    this.rating,
    this.rank,
    this.name,
    this.endDate,
  });

  String code;
  String getyear;
  String getmonth;
  String getday;
  dynamic reason;
  dynamic penalisedIn;
  String rating;
  String rank;
  String name;
  DateTime endDate;

  factory ContestRating.fromJson(Map<String, dynamic> json) => ContestRating(
        code: json["code"],
        getyear: json["getyear"],
        getmonth: json["getmonth"],
        getday: json["getday"],
        reason: json["reason"],
        penalisedIn: json["penalised_in"],
        rating: (json["rating"]),
        rank: json["rank"],
        name: json["name"],
        endDate: DateTime.parse(json["end_date"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "getyear": getyear,
        "getmonth": getmonth,
        "getday": getday,
        "reason": reason,
        "penalised_in": penalisedIn,
        "rating": rating,
        "rank": rank,
        "name": name,
        "end_date": endDate.toIso8601String(),
      };
}

class Contest {
  Contest({
    this.name,
    this.rating,
    this.globalRank,
    this.countryRank,
  });

  String name;
  int rating;
  dynamic globalRank;
  dynamic countryRank;

  factory Contest.fromJson(Map<String, dynamic> json) => Contest(
        name: json["name"],
        rating: json["rating"],
        globalRank: json["global_rank"],
        countryRank: json["country_rank"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rating": rating,
        "global_rank": globalRank,
        "country_rank": countryRank,
      };
}

class UserDetails {
  UserDetails({
    this.name,
    this.username,
    this.country,
    this.state,
    this.city,
    this.studentProfessional,
    this.institution,
  });

  String name;
  String username;
  String country;
  String state;
  String city;
  String studentProfessional;
  String institution;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        name: json["name"],
        username: json["username"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        studentProfessional: json["student/professional"],
        institution: json["institution"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "country": country,
        "state": state,
        "city": city,
        "student/professional": studentProfessional,
        "institution": institution,
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
