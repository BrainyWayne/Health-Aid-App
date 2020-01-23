import 'package:flutter/material.dart';

class HomeBottomLeftTop extends StatefulWidget {
  @override
  _HomeBottomLeftTopState createState() => _HomeBottomLeftTopState();
}

class _HomeBottomLeftTopState extends State<HomeBottomLeftTop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        color: Colors.green,
      ),
    );
  }
}
