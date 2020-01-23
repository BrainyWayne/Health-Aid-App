import 'package:flutter/material.dart';

class HomeBottomLeftDown extends StatefulWidget {
  @override
  _HomeBottomLeftDownState createState() => _HomeBottomLeftDownState();
}

class _HomeBottomLeftDownState extends State<HomeBottomLeftDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        color: Colors.yellow,
      ),
    );
  }
}
