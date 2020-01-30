import 'package:flutter/material.dart';
import 'package:health_aid_app/pages/login.dart';

import 'package:health_aid_app/pages/weatherDetails.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Login(),
      ),
      body: Material(
        child: AnimatedContainer(
          color: Colors.white,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInExpo,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                child: Row(
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                        child: Icon(Icons.menu)),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "healthAid",
                      style: TextStyle(color: Colors.blue, fontSize: 22),
                    )
                  ],
                ),
              ),
              ListView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                          "assets/heart.png",
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Prince Amofah",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              )),
                          Text("Hi Angellos",
                              style: TextStyle(
                                fontSize: 18,
                              )),
                        ],
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
                            child: Stack(
                              children: <Widget>[
                                Container(
                                    width: MediaQuery.of(context).size.width /
                                        2.35,
                                        height: 300,
                                    child: Image.asset(
                                      "assets/weather.jpg",
                                      fit: BoxFit.cover,
                                    )),
                                Column(
                                  children: <Widget>[
                                    Hero(
                                      tag: "widget",
                                      child: Container(
                                        height: 300,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        WeatherDetails()));
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text("Weather",
                                                        style: TextStyle(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.9),
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
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Text("36",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      40)),
                                                          Text(
                                                            "\u00b0",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
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
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      18)),
                                                          SizedBox(height: 3),
                                                          Text("Mostly Sunny",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      15)),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.yellow),
                                      child: Stack(
                                        children: <Widget>[
                                          Container(
                                    width: MediaQuery.of(context).size.width /
                                      2.35,
                                      height: 300,
                                    child: Image.asset(
                                      "assets/diet.jpg",
                                      fit: BoxFit.cover,
                                    )),
                                          Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .end,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text("Diet",
                                                    style: TextStyle(
                                                        color: Colors.yellow
                                                            .withOpacity(0.9),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20)),
                                              ),
                                              
                                            ],
                                          ),
                                        ],
                                      ),
                                        ],
                                      ),
                                    ),
                                  ],
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
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                  width: MediaQuery.of(context).size.width /
                                    2.35,
                                    height: 300,
                                  child: Image.asset(
                                    "assets/doctor.jpg",
                                    fit: BoxFit.cover,
                                  )),
                                    Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.end,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Text("Specialist",
                                                style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.9),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20)),
                                                    Container(
                                            width: 30,
                                            height: 30,
                                            child: Column(
                                              children: <Widget>[
                                                Image.asset(
                                                    "assets/conversation.png",),
                                                SizedBox(height: 3),
                                              ],
                                            ),
                                          )
                                          ],
                                        ),
                                        
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
                                          
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                  height: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.blue),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                  width: MediaQuery.of(context).size.width /
                                    2.35,
                                    height: 300,
                                  child: Image.asset(
                                    "assets/tips.jpg",
                                    fit: BoxFit.cover,
                                  )),
                                      Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
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
                                  ),
                                    ],
                                  )
                                  ),
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
      ),
    );
  }
}
