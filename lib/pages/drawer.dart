import 'package:flutter/material.dart';

import 'login.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipper3(),
              child: Container(
                child: Column(),
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0x44ff3a5a), Colors.blue])),
              ),
            ),
            ClipPath(
              clipper: WaveClipper1(),
              child: Container(
                child: Stack(
                  children: <Widget>[
                    Image.asset('assets/heart.png'),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Colors.blue.withOpacity(0.9),
                        Colors.blue.withOpacity(0.9)
                      ])),
                    )
                  ],
                ),
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.blue, Colors.blue])),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 100,),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Prince Amofah",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.only(left: 20),
                   child: Text(
                      "angellosprince@gmail.com",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                 ),
              ],
            )
          ],
        ),

        Row(
          children: <Widget>[
            SizedBox(width: 16,),
            Icon(Icons.home, color: Colors.black,),
            SizedBox(width: 16,),
            Text("Home", style: TextStyle(color: Colors.black, fontSize: 18,))
          ],
        ),
        SizedBox(height: 30,),
        Row(
          children: <Widget>[
            SizedBox(width: 16,),
            Icon(Icons.account_circle, color: Colors.black,),
            SizedBox(width: 16,),
            Text("Profile", style: TextStyle(color: Colors.black, fontSize: 18,))
          ],
        ),
        SizedBox(height: 30,),
        Row(
          children: <Widget>[
            SizedBox(width: 16,),
            Icon(Icons.notifications, color: Colors.black,),
            SizedBox(width: 16,),
            Text("Notifications", style: TextStyle(color: Colors.black, fontSize: 18,))
          ],
        ),
        SizedBox(height: 30,),
        Row(
          children: <Widget>[
            SizedBox(width: 16,),
            Icon(Icons.info, color: Colors.black,),
            SizedBox(width: 16,),
            Text("About Services", style: TextStyle(color: Colors.black, fontSize: 18,))
          ],
        ),
        SizedBox(height: 30,),
        Row(
          children: <Widget>[
            SizedBox(width: 16,),
            Icon(Icons.contacts, color: Colors.black,),
            SizedBox(width: 16,),
            Text("Contact Us", style: TextStyle(color: Colors.black, fontSize: 18,))
          ],
        ),
        SizedBox(height: 30,),
        
      ],
    ));
  }
}
