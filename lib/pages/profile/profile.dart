import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:health_aid_app/data/data.dart';
import 'package:health_aid_app/locator.dart';
import 'package:health_aid_app/models/doctor_model.dart';
import 'package:health_aid_app/util/back_button.dart';
import 'package:provider/provider.dart';

import './profile_model.dart';
import 'doctors/doctors.dart';

class Profile extends StatelessWidget {
  List<DOCTOR> _list = locator.get<TestData>().doctors;

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    FirebaseUser _user = Provider.of<FirebaseUser>(context);

    return ChangeNotifierProvider<ProfileModel>(
      create: (context) => ProfileModel(),
      child: Consumer<ProfileModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: KBackButton(
              color: Colors.black,
            ),
            centerTitle: true,
            backgroundColor: _theme.scaffoldBackgroundColor,
            title: Text('Profile'),
            actions: <Widget>[KNotification()],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.all(20).copyWith(
                    top: 0,
                  ),
                  color: _theme.primaryColor,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          backgroundImage:
                              CachedNetworkImageProvider('doctor.profile'),
                          child: Icon(EvaIcons.personAddOutline, size: 50),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Text(
                            '${_user.displayName}',
                            style: _theme.textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(height: 7),
                        Container(
                          child: Text(
                            '${_user.email}',
                            style: _theme.textTheme.subtitle2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  clipBehavior: Clip.hardEdge,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.all(20).copyWith(
                    top: 0,
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          EvaIcons.peopleOutline,
                          color: _theme.primaryColor,
                          size: 30,
                        ),
                        title: Text('My Doctors'),
                        trailing: Icon(EvaIcons.chevronRight),
                        onTap: () => Navigator.of(context).push(
                          CupertinoPageRoute(
                            builder: (_) => MyDoctors(_list.take(2).toList()),
                          ),
                        ),
                      ),
                      ListTile(
                          leading: Icon(
                            EvaIcons.calendarOutline,
                            color: _theme.primaryColor,
                            size: 30,
                          ),
                          title: Text('Appointments'),
                          trailing: Icon(EvaIcons.chevronRight)),
                      ListTile(
                        leading: Icon(
                          EvaIcons.clockOutline,
                          color: _theme.primaryColor,
                          size: 30,
                        ),
                        title: Text('Reminers'),
                        onTap: () =>
                            Navigator.of(context).pushNamed('/reminder'),
                        trailing: Icon(EvaIcons.chevronRight),
                      ),
                      ListTile(
                          leading: Icon(
                            EvaIcons.recordingOutline,
                            color: _theme.primaryColor,
                            size: 30,
                          ),
                          title: Text('Medical Records'),
                          trailing: Icon(EvaIcons.chevronRight)),
                      ListTile(
                          leading: Icon(
                            EvaIcons.thermometerPlus,
                            color: _theme.primaryColor,
                            size: 30,
                          ),
                          title: Text('Lab Tests'),
                          trailing: Icon(EvaIcons.chevronRight)),
                      ListTile(
                        leading: Icon(
                          Icons.history,
                          color: _theme.primaryColor,
                          size: 30,
                        ),
                        title: Text('History'),
                        trailing: Icon(EvaIcons.chevronRight),
                      ),
                      ListTile(
                        leading: Icon(
                          EvaIcons.logInOutline,
                          color: _theme.primaryColor,
                          size: 30,
                        ),
                        title: Text('Log Out'),
                        trailing: Icon(EvaIcons.chevronRight),
                        onTap: model.logOut,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
