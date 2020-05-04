import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:health_aid_app/models/doctor_model.dart';
import 'package:health_aid_app/pages/find_doctor/find_doctor_model.dart';
import 'package:health_aid_app/util/back_button.dart';
import 'package:health_aid_app/util/gradient_icon.dart';
import 'package:health_aid_app/util/url_luncher.dart';
import 'package:provider/provider.dart';

class DoctorDetails extends StatelessWidget {
  final DOCTOR doctor;

  DoctorDetails({this.doctor});

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return ChangeNotifierProvider(
      create: (_) => FindDoctorModel(),
      child: Consumer<FindDoctorModel>(
        builder: (_, FindDoctorModel model, __) => Scaffold(
          // appBar: AppBar(
          //   leading: KBackButton(),
          //   title: Text(doctor.name),
          //   actions: <Widget>[
          //     IconButton(icon: Icon(EvaIcons.moreHorizotnal), onPressed: () {})
          //   ],
          // ),
          body: SingleChildScrollView(
            controller: model.controller,
            child: Column(
              children: <Widget>[
                Header(doctor: doctor),
                Padding(
                  padding: EdgeInsets.all(15).copyWith(
                    top: 0,
                  ),
                  child: ExpansionPanelList(
                    expansionCallback: model.openTile,
                    // expandedHeaderPadding: EdgeInsets.all(2),
                    children: [
                      ExpansionPanel(
                        isExpanded: model.tile1,
                        headerBuilder: (context, state) => ListTile(
                          leading: GradientIcon(
                            icon: Icon(
                              EvaIcons.person,
                              color: Colors.white,
                            ),
                          ),
                          title: Text('Personal Info'),
                        ),
                        body: Column(
                          children: <Widget>[
                            ListTile(
                              // leading: GradientIcon(
                              //   icon: Icon(
                              //     EvaIcons.personOutline,
                              //   ),
                              // ),
                              title: Text('Doctor\'s Name'),
                              trailing: Text(doctor.name),
                            ),
                            ListTile(
                              // leading: GradientIcon(
                              //   icon: Icon(
                              //     EvaIcons.personOutline,
                              //   ),
                              // ),
                              title: Text('Years of Experience'),
                              trailing: Text('${doctor.years} years'),
                            ),
                            ListTile(
                              // leading: GradientIcon(
                              //   icon: Icon(
                              //     EvaIcons.personOutline,
                              //   ),
                              // ),
                              title: Text('Title'),
                              trailing: Text(doctor.title),
                            ),
                            ListTile(
                              // leading: GradientIcon(
                              //   icon: Icon(
                              //     EvaIcons.personOutline,
                              //   ),
                              // ),
                              title: Text('Email'),
                              trailing: Text(doctor.contact.email),
                            ),
                          ],
                        ),
                      ),
                      ExpansionPanel(
                        isExpanded: model.tile2,
                        headerBuilder: (context, state) => ListTile(
                          leading: GradientIcon(
                            icon: Icon(
                              EvaIcons.car,
                              color: Colors.white,
                            ),
                          ),
                          title: Text('Working Address'),
                        ),
                        body: Column(
                          children: <Widget>[
                            ListTile(
                              // leading: GradientIcon(
                              //   icon: Icon(
                              //     EvaIcons.personOutline,
                              //   ),
                              // ),
                              title: Text('Hospital'),
                              trailing: Text(doctor.hospital),
                            ),
                            ListTile(
                              // leading: GradientIcon(
                              //   icon: Icon(
                              //     EvaIcons.personOutline,
                              //   ),
                              // ),
                              title: Text('Location'),
                              trailing: GestureDetector(
                                ///latitude and longitude
                                onTap: () => Url.launchURL(
                                    'https://www.google.com/maps/search/?api=1&query=47.5951518,-122.3316393'),
                                child: GradientText(
                                  doctor.contact.location,
                                  style: _theme.textTheme.bodyText1,
                                ),
                              ),
                            ),
                            ListTile(
                              // leading: GradientIcon(
                              //   icon: Icon(
                              //     EvaIcons.personOutline,
                              //   ),
                              // ),
                              title: Text('Email'),
                              trailing: Text(doctor.contact.email),
                            ),
                          ],
                        ),
                      ),
                      ExpansionPanel(
                        isExpanded: model.tile3,
                        headerBuilder: (context, state) => ListTile(
                          leading: GradientIcon(
                            icon: Icon(
                              EvaIcons.pieChart2,
                              color: Colors.white,
                            ),
                          ),
                          title: Text('Specialities'),
                        ),
                        body: ListView.builder(
                          shrinkWrap: true,
                          itemCount: doctor.specialities.length,
                          itemBuilder: (context, index) => ListTile(
                            title: Text(doctor.specialities[index]),
                          ),
                        ),
                      ),
                      ExpansionPanel(
                        isExpanded: model.tile4,
                        headerBuilder: (context, state) => ListTile(
                          leading: GradientIcon(
                            icon: Icon(
                              EvaIcons.starOutline,
                              color: Colors.white,
                            ),
                          ),
                          title: Text('Reviewers'),
                        ),
                        body: true
                            ? Center(
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  child: Text('No Reviewers'),
                                ),
                              )
                            : ListView(
                                shrinkWrap: true,
                                children: <Widget>[],
                              ),
                      ),
                    ],
                  ),
                ),
                GradientButton(
                  gradient: Gradients.coldLinear,
                  shapeRadius: BorderRadius.circular(10),
                  increaseHeightBy: 20,
                  increaseWidthBy: MediaQuery.of(context).size.width - 120,
                  child: Text('BOOk APPOINTMENT'),
                  callback: () {},
                ),
                SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.doctor,
  }) : super(key: key);

  final DOCTOR doctor;

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Container(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: Gradients.coldLinear,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: 'email',
                      child: Icon(EvaIcons.email),
                      mini: true,
                      onPressed: () => Url.launchURL(
                          'mailto:${doctor.contact.email}?subject=<subject>&body=<body>'),
                    ),
                    Hero(
                      tag: doctor.profile,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (context) => FullImage(doctor.profile));
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 70,
                          backgroundImage:
                              CachedNetworkImageProvider(doctor.profile),
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      heroTag: 'call',
                      child: Icon(EvaIcons.phoneCall),
                      mini: true,
                      onPressed: () =>
                          Url.launchURL('tel:${doctor.contact.phone}'),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    doctor.name,
                    style: _theme.textTheme.subtitle1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        EvaIcons.star,
                        color: Colors.amber,
                      ),
                      Icon(
                        EvaIcons.star,
                        color: Colors.amber,
                      ),
                      Icon(
                        EvaIcons.star,
                        color: Colors.amber,
                      ),
                      Icon(EvaIcons.starOutline),
                      Icon(EvaIcons.starOutline),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    '${doctor.title} at ${doctor.hospital} ',
                    style: _theme.textTheme.subtitle2,
                  ),
                )
              ],
            ),
          ),
          SafeArea(child: KBackButton()),
        ],
      ),
    );
  }
}

class FullImage extends StatelessWidget {
  final String url;
  FullImage(this.url);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Hero(
          tag: url,
          child: CachedNetworkImage(
            imageUrl: url,
          ),
        ),
      ),
    );
  }
}
