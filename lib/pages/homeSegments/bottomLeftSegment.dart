import 'package:flutter/material.dart';
import 'package:health_aid_app/pages/homeSegments/bottomLeftDownSegment.dart';
import 'package:health_aid_app/pages/homeSegments/bottomLeftTopSegment.dart';

class HomeBottomLeftSegment extends StatefulWidget {
  @override
  _HomeBottomLeftSegmentState createState() => _HomeBottomLeftSegmentState();
}

class _HomeBottomLeftSegmentState extends State<HomeBottomLeftSegment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        color: Colors.green,
        child: Container(
          child: Column(
            children: <Widget>[
              HomeBottomLeftTop(),
              HomeBottomLeftDown(),
            ],
          ),
        ),
      ),
    );
  }
}
