import 'package:flutter/material.dart';
import '../usersapi.dart';
import 'Registration.dart';

class Myregisterpage extends StatefulWidget {
  @override
  MyregisterpageState createState() => MyregisterpageState();
}

class MyregisterpageState extends State<Myregisterpage> {
  UserManager userManager = new UserManager(Uri.parse(
      'https://codeforces.com/api/user.info?handles=' +
          RegiState.codeforcesController.text));
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data.result[0].avatar
                                              .toString()),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text: '\n' +
                                            snapshot.data.result[0].rank
                                                .toString()
                                                .toUpperCase(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.white,
                                        ))
                                  ])),
                                  RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text: '\n' +
                                            'Username: ' +
                                            snapshot.data.result[0].handle,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white,
                                        )),
                                  ])),
                                  if (snapshot.data.result[0].firstName !=
                                          null &&
                                      snapshot.data.result[0].lastName != null)
                                    RichText(
                                        text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text: 'Name: ' +
                                              snapshot.data.result[0].firstName
                                                  .toString() +
                                              ' ' +
                                              snapshot.data.result[0].lastName
                                                  .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.white,
                                          ))
                                    ])),
                                  RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text: 'Codeforces Rating: ' +
                                            snapshot.data.result[0].rating
                                                .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white,
                                        ))
                                  ])),
                                  RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text: 'Codeforces Max. Rating: ' +
                                            snapshot.data.result[0].maxRating
                                                .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white,
                                        ))
                                  ]))
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
                              return CircularProgressIndicator();
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
