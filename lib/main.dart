import 'dart:async';

import 'package:flutter/material.dart';
import 'package:health_aid_app/pages/home.dart';
import 'package:health_aid_app/pages/login.dart';
import 'package:health_aid_app/pages/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

   double pulseValue;
   double pulseValueGrey;


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
   

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Login()));
    });


    pulseIn();
    


    super.initState();
  }

  void pulseOut() {
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        setState(() {
          pulseValue = 120;
          pulseValueGrey = 200;
        });
      });
      pulseIn();
    });
  }

  void pulseIn() {
    Timer(Duration(milliseconds: 500), () {
      setState(() {
        setState(() {
          pulseValue = 200;
          pulseValueGrey = 120;
        });
      });
      pulseOut();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeIn,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeIn,
                height: pulseValueGrey,
                width: pulseValueGrey,
                child: Image.asset(
                  "assets/cancer-2.png",
                  fit: BoxFit.cover,
                  color: Colors.grey,
                ),
              ),
            ),
            Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeIn,
                height: pulseValue,
                width: pulseValue,
                child: Image.asset(
                  "assets/cancer-2.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
}
