import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:health_aid_app/models/doctor_model.dart';
import 'package:health_aid_app/util/back_button.dart';
import 'package:health_aid_app/util/gradient_icon.dart';
import 'package:health_aid_app/util/spinner.dart';

class LatTests extends StatelessWidget {
  final List<DOCTOR> doctors;

  LatTests(this.doctors);
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: KBackButton(
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: _theme.scaffoldBackgroundColor,
        title: Text('My Doctors'),
        actions: <Widget>[KNotification()],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: doctors.length,
        itemBuilder: (BuildContext context, int index) {
          return LabTestCard(doctors[index]);
        },
      ),
    );
  }
}

class LabTestCard extends StatelessWidget {
  final appointment;

  LabTestCard(this.appointment);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
