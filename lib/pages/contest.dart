import 'package:flutter/material.dart';
import 'package:codeforces/contestapi.dart';

class Contest extends StatefulWidget {
  @override
  ContestState createState() => ContestState();
}

class ContestState extends State<Contest> {
  ContestManager userManager = new ContestManager(
      Uri.parse('https://codeforces.com/api/contest.list?gym=flase'));

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
      body: FutureBuilder(
        future: user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Container(
                      child: Card(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: snapshot.data.result[index].name
                                        .toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    )),
                              ),
                              if (((snapshot.data.result[index]
                                                  .relativeTimeSeconds) /
                                              3600) *
                                          (-1) <
                                      24 &&
                                  ((snapshot.data.result[index]
                                                  .relativeTimeSeconds) /
                                              3600) *
                                          (-1) >
                                      0)
                                RichText(
                                  text: TextSpan(
                                      text: "Contest is about to start in " +
                                          (((snapshot.data.result[index]
                                                          .relativeTimeSeconds) /
                                                      3600) *
                                                  (-1))
                                              .toStringAsFixed(0) +
                                          ' Hours',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      )),
                                )
                              else if ((((snapshot.data.result[index]
                                              .relativeTimeSeconds) /
                                          3600) *
                                      (-1) >
                                  24))
                                RichText(
                                  text: TextSpan(
                                      text: "Contest is about to start in " +
                                          (((snapshot.data.result[index]
                                                          .relativeTimeSeconds) /
                                                      86400) *
                                                  (-1))
                                              .toStringAsFixed(0) +
                                          ' Days',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      )),
                                )
                              else
                                RichText(
                                  text: TextSpan(
                                      text: "Contest Has Started/Finished ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      )),
                                )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: snapshot.data.result.length - 1,
                ),
              ),
            );
          } else
            return CircularProgressIndicator();
        },
      ),
    );
  }
}
