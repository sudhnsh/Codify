import 'package:flutter/material.dart';
import 'ccuserpage.dart';
import 'ccanalytic.dart';

class CcMain extends StatefulWidget {
  @override
  _CcMainState createState() => _CcMainState();
}

class _CcMainState extends State<CcMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.black,
            child: Container(
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
