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
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              // Container(
              //     child: Image.asset(
              //       "assets/heart.png",
              //       fit: BoxFit.cover,
              //     )),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Icon(Icons.menu, color: Color(0xffcc00008b)),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text("health",
                            style: TextStyle(
                              color: Color(0xffcc00008b),
                              fontSize: 20,
                            )),
                        Text(
                          "Aid",
                          style: TextStyle(
                            color: Color(0xffcc00008b),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 20),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        "assets/heart.png",
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "Francis Eshun",
                      style: TextStyle(
                        color: Color(0xffcc00008b),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 230, left: 20, right: 20, bottom: 20),
                child: Column(
                  children: <Widget>[
                    Row(
                      
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        
                        
                        Text(
                          "Weather",
                          style: TextStyle(color: Color(0xffcc00008b), fontSize: 23),
                        ),

                        Text(
                          "View more",
                          style: TextStyle(color: Color(0xffcc00008b), fontSize: 15),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 18, top: 10),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Container(
                      margin: EdgeInsets.only(
                          top: 20, left: 30, right: 20, bottom: 15),
                      child: Row(
                        children: <Widget>[
                          Text("36",
                              style:
                                  TextStyle(color: Color(0xffcc00008b), fontSize: 40)),
                          Text(
                            "\u00b0",
                            style: TextStyle(color: Color(0xffcc00008b), fontSize: 45),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              'assets/jotta-cloud.png',
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("Kumasi",
                                  style: TextStyle(
                                      color: Color(0xffcc00008b), fontSize: 18)),
                              SizedBox(height: 3),
                              Text("Mostly Sunny",
                                  style: TextStyle(
                                      color: Color(0xffcc00008b), fontSize: 15)),
                            ],
                          )
                        ],
                      ),
                    ),
                    )
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
