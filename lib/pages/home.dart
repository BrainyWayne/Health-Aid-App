import 'package:flutter/material.dart';

import 'package:health_aid_app/pages/homeSegments/topSegment.dart';
import 'package:health_aid_app/pages/weatherDetails.dart';
import 'package:health_aid_app/util/rowDays.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimatedContainer(
        color: Colors.white,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInExpo,
        child: Stack(
          children: <Widget>[
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              children: <Widget>[
                rowDays(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Hey, Francis!",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("Your dashboard for today",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                      ],
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(
                        "assets/heart.png",
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width / 2.35,
                          child: Column(
                            children: <Widget>[
                              Hero(
                                tag: "widget",
                                child: Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.red),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  WeatherDetails()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text("Weather",
                                                  style: TextStyle(
                                                      color: Colors.white
                                                          .withOpacity(0.9),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20)),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                  child: Image.asset(
                                                'assets/sun.png',
                                                color: Colors.white,
                                              ))
                                            ],
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 30,
                                                left: 30,
                                                right: 30,
                                                bottom: 30),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text("36",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 40)),
                                                    Text(
                                                      "\u00b0",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 45),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  child: Image.asset(
                                                    'assets/jotta-cloud.png',
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Column(
                                                  children: <Widget>[
                                                    Text("Kumasi",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 18)),
                                                    SizedBox(height: 3),
                                                    Text("Mostly Sunny",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15)),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                height: 180,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.yellow),
                              ),
                            ],
                          )),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.green),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text("Specialist",
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.9),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        Container(
                                                height: 30,
                                                width: 30,
                                                  child: Image.asset(
                                                'assets/specialist.png',
                                                color: Colors.white,
                                              ))
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: 30,
                                          left: 30,
                                          right: 30,
                                          bottom: 30),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                  "Connect",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18)),
                                              SizedBox(height: 3),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                                height: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.blue),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text("Health Tips",
                                              style: TextStyle(
                                                  color: Colors.white
                                                      .withOpacity(0.9),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                          Icon(
                                            Icons.healing,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
