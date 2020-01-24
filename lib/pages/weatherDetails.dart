import 'package:flutter/material.dart';
import 'package:health_aid_app/util/rowDays.dart';

class WeatherDetails extends StatefulWidget {
  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical:20),
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            rowDays(),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Weather",
                    style: TextStyle(
                        color: Colors.red.withOpacity(0.9),
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
                Icon(
                  Icons.web_asset,
                  color: Colors.red,
                )
              ],
            ),
            SizedBox(height: 30,),
            Hero(
              tag: "widget",
                          child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15), color: Colors.red),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                          top: 30, left: 30, right: 30, bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("36",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 40)),
                              Text(
                                "\u00b0",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 45),
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
                                      color: Colors.white, fontSize: 18)),
                              SizedBox(height: 3),
                              Text("Mostly Sunny",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
