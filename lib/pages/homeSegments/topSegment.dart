import 'package:flutter/material.dart';

class homeTopSegment extends StatefulWidget {
  @override
  _homeTopSegmentState createState() => _homeTopSegmentState();
}

class _homeTopSegmentState extends State<homeTopSegment> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          color: Colors.red,
          child: Stack(
            children: <Widget>[
              Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Image.asset(
                    "assets/heart.png",
                    fit: BoxFit.cover,
                  )),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.9),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Icon(Icons.menu, color: Colors.white),
                    SizedBox(width: 20,),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text("health",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            )),
                        Text("Aid",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
