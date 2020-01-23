import 'package:flutter/material.dart';
import 'package:health_aid_app/pages/homeSegments/bottomLeftSegment.dart';
import 'package:health_aid_app/pages/homeSegments/homeBottomRight.dart';
import 'package:health_aid_app/pages/homeSegments/topSegment.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInExpo,
      child: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                homeTopSegment(),
                Container(
                  child: Row(
                    children: <Widget>[
                      HomeBottomLeftSegment(),
                      HomeBottomRightSegment(),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
