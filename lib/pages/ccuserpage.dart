import 'package:flutter/material.dart';
import '../ccuserapi.dart';
import 'Registration.dart';
import 'package:flutter_colored_progress_indicators/flutter_colored_progress_indicators.dart';

class Myregisterpage extends StatefulWidget {
  @override
  MyregisterpageState createState() => MyregisterpageState();
}

class MyregisterpageState extends State<Myregisterpage> {
  UserManager userManager = new UserManager(Uri.parse(
      'https://competitive-coding-api.herokuapp.com/api' +
          '/codechef' +
          '/' +
          RegiState.codechefController.text));
  Future<Users> user;
  @override
  void initState() {
    super.initState();
    user = userManager.getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Container(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              margin: EdgeInsets.symmetric(vertical: 10),
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder(
                        future: user,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(snapshot.data.stars,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                  RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text: 'Name: ' +
                                            snapshot.data.userDetails.name,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ])),
                                  Text(
                                      'Highest Rating: ' +
                                          snapshot.data.highestRating
                                              .toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                  Text(
                                      'Current Rating: ' +
                                          snapshot.data.rating.toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                  Text(
                                      'Country Rank: ' +
                                          snapshot.data.countryRank.toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                  Text(
                                      'Global Rank: ' +
                                          snapshot.data.globalRank.toString(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )),
                                ]);
                          } else {
                            if (snapshot.hasError)
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.error_outline,
                                      color: Colors.white, size: 30),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      'Invalid Username\nPlease try again!',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            else
                              return ColoredCircularProgressIndicator();
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
