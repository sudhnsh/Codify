import 'package:codeforces/pages/analytics.dart';
import 'package:flutter/material.dart';
import './pages/Registration.dart';
import './pages/userpage.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codify',
      home: Regi(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Card(
            color: Colors.grey[50],
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 6,
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: 'To View User\'s Detail Tap Below:\n',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Myregisterpage()),
                      );
                    },
                    child: Text('UserInfo'),
                    style: ElevatedButton.styleFrom(primary: Colors.cyan[500]),
                  ),
                  RichText(
                    text: TextSpan(
                        text:
                            '\nTo View User\'s Recent Performance Tap Below:\n',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RatingChange()),
                      );
                    },
                    child: Text('Analytic'),
                    style: ElevatedButton.styleFrom(primary: Colors.cyan),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
