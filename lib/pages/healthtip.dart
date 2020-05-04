import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:health_aid_app/models/health_tip_model.dart';
import 'package:health_aid_app/util/back_button.dart';

class HealthTip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Health Tips",
                    style: TextStyle(
                        color: Colors.red.withOpacity(0.9),
                        fontWeight: FontWeight.bold,
                        fontSize: 30)),
                Container(
                  height: 40,
                  width: 40,
                  child: KNotification(),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              'Get health tips from our daily health update blog and stay healty',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 320,
            // padding: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                HealthTipCard(),
              ],
            ),
          ),
          SizedBox(height: 10),
          KBackButton(color: Colors.black),
        ],
      ),
    );
  }
}

class HealthTipCard extends StatelessWidget {
  final HEALTHTIP healthtip;
  final int index;

  const HealthTipCard({
    Key key,
    this.healthtip,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.only(left: 10, bottom: 20, right: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.yellow[100],
      child: Container(
        width: 220,
        padding: EdgeInsets.all(10),
        // height: 200,
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Monday Apirl 34th',
                style: _theme.textTheme.caption.copyWith(
                  color: Colors.grey,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Neurobics for your mind',
                style: _theme.textTheme.headline4,
              ),
            ),
            Spacer(),
            Expanded(
              child: Row(
                children: <Widget>[
                  Text(
                    '1/3',
                    style: _theme.textTheme.caption,
                  ),
                  Spacer(),
                  Text(
                    'Read More',
                    style: _theme.textTheme.caption,
                  ),
                  SizedBox(width: 5),
                  Icon(EvaIcons.arrowForward)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
