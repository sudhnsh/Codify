import 'package:codeforces/pages/ccmain.dart';
import 'package:codeforces/pages/contest.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';
import 'package:flutter/material.dart';

class Regi extends StatefulWidget {
  @override
  RegiState createState() => RegiState();
}

class RegiState extends State<Regi> {
  static final codeforcesController = TextEditingController();
  static final codechefController = TextEditingController();

  _launchURLBrowser() async {
    const url = 'https://www.geeksforgeeks.org/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
          child: Center(
              child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.black,
            elevation: 10,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 90, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                          text:
                              'Enter Your Codechef ID to view your recent performance:\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    TextField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      onSubmitted: (_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CcMain()),
                        );
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Codechef Username',
                          focusColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          )),
                      controller: codechefController,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CcMain()),
                          );
                        },
                        style:
                            ElevatedButton.styleFrom(primary: Colors.cyan[500]),
                        child: Text('Submit')),
                    RichText(
                      text: TextSpan(
                          text:
                              'Enter Your Codeforces ID to view your recent performance:\n',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    TextField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      onSubmitted: (_) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Codeforces Username',
                          focusColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          )),
                      controller: codeforcesController,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                        },
                        style:
                            ElevatedButton.styleFrom(primary: Colors.cyan[500]),
                        child: Text('Submit')),
                    RichText(
                      text: TextSpan(
                          text:
                              '\nTo See Upcoming And Previous Codeforces Contests Click Below:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Contest()),
                          );
                        },
                        style:
                            ElevatedButton.styleFrom(primary: Colors.cyan[500]),
                        child: Text('View Contests')),
                    // ElevatedButton(
                    //     onPressed: _launchURLBrowser,
                    //     style:
                    //         ElevatedButton.styleFrom(primary: Colors.cyan[500]),
                    //     child: Text('View Contests in Calender'))
                  ],
                ),
              ),
            ),
          )),
        ));
  }
}
