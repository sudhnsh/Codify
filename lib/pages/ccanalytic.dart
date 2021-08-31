import 'package:flutter/material.dart';
import 'package:flutter_colored_progress_indicators/flutter_colored_progress_indicators.dart';
import 'Registration.dart';
import '../ccuserapi.dart';

class RatingChange extends StatefulWidget {
  @override
  _RatingChangeState createState() => _RatingChangeState();
}

class _RatingChangeState extends State<RatingChange> {
  String username = RegiState.codechefController.text;
  UserManager userManager = new UserManager(Uri.parse(
      'https://competitive-coding-api.herokuapp.com/api/codechef/' +
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
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FutureBuilder(
                        future: user,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi, ' + username,
                                  style: TextStyle(
                                      color: Colors.deepPurple,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                if (snapshot.data.contestRatings.length >= 1)
                                  RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text: 'Your Rank in the last Contest is ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 17),
                                    ),
                                    TextSpan(
                                      text: (snapshot
                                              .data
                                              .contestRatings[snapshot.data
                                                      .contestRatings.length -
                                                  1]
                                              .rank)
                                          .toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.teal[400]),
                                    ),
                                    TextSpan(
                                        text: '.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.white,
                                        ))
                                  ])),
                                if (snapshot.data.contestRatings.length == 0)
                                  RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          'You hasn\'t participated in any contests\n',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 17),
                                    ),
                                  ])),
                                if ((int.parse(snapshot
                                                .data
                                                .contestRatings[snapshot.data
                                                        .contestRatings.length -
                                                    1]
                                                .rating) -
                                            int.parse(snapshot
                                                .data
                                                .contestRatings[snapshot.data
                                                        .contestRatings.length -
                                                    2]
                                                .rating)) >=
                                        0 &&
                                    (snapshot.data.contestRatings.length) >= 2)
                                  RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          'Your rating change in the last contest is ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 17),
                                    ),
                                    TextSpan(
                                        text: (int.parse(snapshot
                                                    .data
                                                    .contestRatings[snapshot
                                                            .data
                                                            .contestRatings
                                                            .length -
                                                        1]
                                                    .rating) -
                                                int.parse(snapshot
                                                    .data
                                                    .contestRatings[snapshot
                                                            .data
                                                            .contestRatings
                                                            .length -
                                                        2]
                                                    .rating))
                                            .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.green[400],
                                        )),
                                    TextSpan(
                                        text: '.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.white,
                                        ))
                                  ]))
                                else if ((int.parse(snapshot
                                                .data
                                                .contestRatings[snapshot.data
                                                        .contestRatings.length -
                                                    1]
                                                .rating) -
                                            int.parse(snapshot
                                                .data
                                                .contestRatings[snapshot.data
                                                        .contestRatings.length -
                                                    2]
                                                .rating)) <
                                        0 &&
                                    (snapshot.data.contestRatings.length) >= 2)
                                  RichText(
                                      text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                      text:
                                          'Your rating change in the last contest is ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 17),
                                    ),
                                    TextSpan(
                                        text: (int.parse(snapshot
                                                    .data
                                                    .contestRatings[snapshot
                                                            .data
                                                            .contestRatings
                                                            .length -
                                                        1]
                                                    .rating) -
                                                int.parse(snapshot
                                                    .data
                                                    .contestRatings[snapshot
                                                            .data
                                                            .contestRatings
                                                            .length -
                                                        2]
                                                    .rating))
                                            .toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.red[400],
                                        )),
                                    TextSpan(
                                        text: '.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.white,
                                        )),
                                  ])),
                                if ((snapshot.data.contestRatings.length) >=
                                        3 &&
                                    ((int.parse(snapshot
                                                .data
                                                .contestRatings[snapshot.data
                                                        .contestRatings.length -
                                                    1]
                                                .rating) -
                                            int.parse(snapshot
                                                .data
                                                .contestRatings[snapshot.data
                                                        .contestRatings.length -
                                                    3]
                                                .rating)) >=
                                        0))
                                  RichText(
                                    text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              'Your average rating change in recent 3 contests is ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 17,
                                            color: Colors.white,
                                          )),
                                      TextSpan(
                                          text: ((int.parse(snapshot
                                                          .data
                                                          .contestRatings[snapshot
                                                                  .data
                                                                  .contestRatings
                                                                  .length -
                                                              1]
                                                          .rating) -
                                                      int.parse(snapshot
                                                          .data
                                                          .contestRatings[snapshot
                                                                  .data
                                                                  .contestRatings
                                                                  .length -
                                                              3]
                                                          .rating)) /
                                                  3)
                                              .toStringAsFixed(2),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.green[400],
                                          )),
                                      TextSpan(
                                          text: '.',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.white,
                                          ))
                                    ]),
                                  )
                                else if ((snapshot
                                            .data.contestRatings.length) >=
                                        3 &&
                                    ((int.parse(snapshot
                                                .data
                                                .contestRatings[snapshot.data
                                                        .contestRatings.length -
                                                    1]
                                                .rating) -
                                            int.parse(snapshot
                                                .data
                                                .contestRatings[snapshot.data
                                                        .contestRatings.length -
                                                    3]
                                                .rating)) <
                                        0))
                                  RichText(
                                    text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              'Your average rating change in recent 3 contests is ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 17,
                                            color: Colors.white,
                                          )),
                                      TextSpan(
                                          text: (((int.parse(snapshot
                                                          .data
                                                          .contestRatings[snapshot
                                                                  .data
                                                                  .contestRatings
                                                                  .length -
                                                              1]
                                                          .rating) -
                                                      int.parse(snapshot
                                                          .data
                                                          .contestRatings[snapshot
                                                                  .data
                                                                  .contestRatings
                                                                  .length -
                                                              3]
                                                          .rating))) /
                                                  3)
                                              .toStringAsFixed(2),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.red[400],
                                          )),
                                      TextSpan(
                                          text: '.',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 17,
                                            color: Colors.white,
                                          ))
                                    ]),
                                  ),
                                if ((snapshot.data.contestRatings.length) ==
                                        2 &&
                                    ((int.parse(snapshot
                                                .data
                                                .contestRatings[snapshot.data
                                                        .contestRatings.length -
                                                    1]
                                                .rating) -
                                            int.parse(snapshot
                                                .data
                                                .contestRatings[snapshot.data
                                                        .contestRatings.length -
                                                    2]
                                                .rating)) >=
                                        0))
                                  RichText(
                                    text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              'Your average rating change in recent 2 contests is ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 17,
                                            color: Colors.white,
                                          )),
                                      TextSpan(
                                          text: (((int.parse(snapshot
                                                          .data
                                                          .contestRatings[snapshot
                                                                  .data
                                                                  .contestRatings
                                                                  .length -
                                                              2]
                                                          .rating) -
                                                      int.parse(snapshot
                                                          .data
                                                          .contestRatings[snapshot
                                                                  .data
                                                                  .contestRatings
                                                                  .length -
                                                              1]
                                                          .rating))) /
                                                  2)
                                              .toStringAsFixed(2),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.red[400],
                                          )),
                                      TextSpan(
                                          text: '.',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                          ))
                                    ]),
                                  )
                                else if ((snapshot
                                            .data.contestRatings.length) ==
                                        2 &&
                                    ((int.parse(snapshot
                                                .data
                                                .contestRatings[snapshot.data
                                                        .contestRatings.length -
                                                    1]
                                                .rating) -
                                            int.parse(snapshot
                                                .data
                                                .contestRatings[snapshot.data
                                                        .contestRatings.length -
                                                    2]
                                                .rating)) <
                                        0))
                                  RichText(
                                    text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                          text:
                                              'Your average rating change in recent 2 contests is ',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                          )),
                                      TextSpan(
                                          text: (((int.parse(snapshot
                                                          .data
                                                          .contestRatings[snapshot
                                                                  .data
                                                                  .contestRatings
                                                                  .length -
                                                              2]
                                                          .rating) -
                                                      int.parse(snapshot
                                                          .data
                                                          .contestRatings[snapshot
                                                                  .data
                                                                  .contestRatings
                                                                  .length -
                                                              1]
                                                          .rating))) /
                                                  2)
                                              .toStringAsFixed(2),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.green[400],
                                          )),
                                      TextSpan(
                                          text: '.',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.white,
                                          ))
                                    ]),
                                  )
                              ],
                            );
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
