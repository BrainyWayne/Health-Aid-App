import 'package:flutter/material.dart';

class HomeBottomRightSegment extends StatefulWidget {
  @override
  _HomeBottomRightSegmentState createState() => _HomeBottomRightSegmentState();
}

class _HomeBottomRightSegmentState extends State<HomeBottomRightSegment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        color: Colors.blue,
      ),
    );
  }
}
