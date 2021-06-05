import 'package:flutter/material.dart';
import 'Registration.dart';
import '../analyticsapi.dart';

class RatingChange extends StatefulWidget {
  @override
  _RatingChangeState createState() => _RatingChangeState();
}

class _RatingChangeState extends State<RatingChange> {
  String username = RegiState.codeforcesController.text;
  RatingManager userManager = new RatingManager(Uri.parse(
      'https://codeforces.com/api/user.rating?handle=' +
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi, ' + username,
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                if (snapshot.data.result.length >= 1)
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
                                                .result[snapshot
                                                        .data.result.length -
                                                    1]
                                                .rank)
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.purple)),
                                    TextSpan(
                                        text: '.',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.white,
                                        ))
                                  ])),
                                if (snapshot.data.result.length == 0)
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
                                if ((snapshot
                                                .data
                                                .result[snapshot
                                                        .data.result.length -
                                                    1]
                                                .newRating -
                                            snapshot
                                                .data
                                                .result[snapshot
                                                        .data.result.length -
                                                    1]
                                                .oldRating) >=
                                        0 &&
                                    (snapshot.data.result.length) >= 1)
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
                                        text: (snapshot
                                                    .data
                                                    .result[snapshot.data.result
                                                            .length -
                                                        1]
                                                    .newRating -
                                                snapshot
                                                    .data
                                                    .result[snapshot.data.result
                                                            .length -
                                                        1]
                                                    .oldRating)
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
                                else if ((snapshot
                                                .data
                                                .result[snapshot
                                                        .data.result.length -
                                                    1]
                                                .newRating -
                                            snapshot
                                                .data
                                                .result[snapshot
                                                        .data.result.length -
                                                    1]
                                                .oldRating) <
                                        0 &&
                                    (snapshot.data.result.length) >= 1)
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
                                        text: (snapshot
                                                    .data
                                                    .result[snapshot.data.result
                                                            .length -
                                                        1]
                                                    .newRating -
                                                snapshot
                                                    .data
                                                    .result[snapshot.data.result
                                                            .length -
                                                        1]
                                                    .oldRating)
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
                                if ((snapshot.data.result.length) >= 3 &&
                                    ((snapshot
                                                .data
                                                .result[snapshot
                                                        .data.result.length -
                                                    3]
                                                .oldRating) -
                                            (snapshot
                                                .data
                                                .result[snapshot
                                                        .data.result.length -
                                                    1]
                                                .newRating) >
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
                                          text: (((snapshot
                                                          .data
                                                          .result[snapshot
                                                                  .data
                                                                  .result
                                                                  .length -
                                                              1]
                                                          .newRating) -
                                                      (snapshot
                                                          .data
                                                          .result[snapshot
                                                                  .data
                                                                  .result
                                                                  .length -
                                                              3]
                                                          .oldRating)) /
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
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.white,
                                          ))
                                    ]),
                                  )
                                else if ((snapshot.data.result.length) >= 3 &&
                                    ((snapshot
                                                .data
                                                .result[snapshot
                                                        .data.result.length -
                                                    3]
                                                .oldRating) -
                                            (snapshot
                                                .data
                                                .result[snapshot
                                                        .data.result.length -
                                                    1]
                                                .newRating) <=
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
                                          text: (((snapshot
                                                          .data
                                                          .result[snapshot
                                                                  .data
                                                                  .result
                                                                  .length -
                                                              1]
                                                          .newRating) -
                                                      (snapshot
                                                          .data
                                                          .result[snapshot
                                                                  .data
                                                                  .result
                                                                  .length -
                                                              3]
                                                          .oldRating)) /
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
                                            fontWeight: FontWeight.normal,
                                            fontSize: 17,
                                            color: Colors.white,
                                          ))
                                    ]),
                                  ),
                                if ((snapshot.data.result.length) == 2 &&
                                    ((snapshot
                                                .data
                                                .result[snapshot
                                                        .data.result.length -
                                                    2]
                                                .oldRating) -
                                            (snapshot
                                                .data
                                                .result[snapshot
                                                        .data.result.length -
                                                    1]
                                                .newRating) >
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
                                          text: (((snapshot
                                                          .data
                                                          .result[snapshot
                                                                  .data
                                                                  .result
                                                                  .length -
                                                              2]
                                                          .newRating) -
                                                      (snapshot
                                                          .data
                                                          .result[snapshot
                                                                  .data
                                                                  .result
                                                                  .length -
                                                              1]
                                                          .oldRating)) /
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
                                else if ((snapshot.data.result.length) == 2 &&
                                    ((snapshot
                                                .data
                                                .result[snapshot
                                                        .data.result.length -
                                                    2]
                                                .oldRating) -
                                            (snapshot
                                                .data
                                                .result[snapshot
                                                        .data.result.length -
                                                    1]
                                                .newRating) <=
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
                                          text: (((snapshot
                                                          .data
                                                          .result[snapshot
                                                                  .data
                                                                  .result
                                                                  .length -
                                                              2]
                                                          .oldRating) -
                                                      (snapshot
                                                          .data
                                                          .result[snapshot
                                                                  .data
                                                                  .result
                                                                  .length -
                                                              1]
                                                          .newRating)) /
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
