import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:health_aid_app/models/doctor_model.dart';
import 'package:health_aid_app/util/back_button.dart';
import 'package:health_aid_app/util/gradient_icon.dart';
import 'package:health_aid_app/util/spinner.dart';

class MyDoctors extends StatelessWidget {
  final List<DOCTOR> doctors;

  MyDoctors(this.doctors);
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
          return DoctorCard(doctors[index]);
        },
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final DOCTOR doctor;

  DoctorCard(this.doctor);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Container(
      child: Card(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.all(4),
        child: InkWell(
          onTap: () => Navigator.of(context)
              .pushNamed('/doctor_details', arguments: doctor),
          child: Row(
            children: [
              Container(
                child: Hero(
                  tag: doctor.profile,
                  child: CachedNetworkImage(
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                    imageUrl: doctor.profile,
                    errorWidget: (context, string, _) => Image(
                      image: AssetImage('assets/images/doctor.png'),
                      loadingBuilder: (context, child, chunk) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Spinner(),
                          Text(
                              '${chunk.cumulativeBytesLoaded} / ${chunk.expectedTotalBytes}')
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        doctor.name,
                        style: _theme.textTheme.headline6,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: <Widget>[
                          GradientIcon(
                            icon: Icon(
                              EvaIcons.briefcaseOutline,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '${doctor.title} at ${doctor.hospital}',
                              maxLines: 2,
                              style: _theme.textTheme.caption.copyWith(
                                height: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          GradientIcon(
                            icon: Icon(
                              EvaIcons.pin,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '${doctor.contact.location}',
                              maxLines: 2,
                              style: _theme.textTheme.caption.copyWith(
                                height: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: <Widget>[
                          GradientIcon(
                            icon: Icon(
                              EvaIcons.briefcaseOutline,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              '${doctor.years} year of Experience',
                              maxLines: 2,
                              style: _theme.textTheme.caption.copyWith(
                                height: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
