import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:health_aid_app/models/doctor_model.dart';
import 'package:health_aid_app/models/hospital_model.dart';
import 'package:health_aid_app/util/back_button.dart';
import 'package:health_aid_app/util/gradient_icon.dart';
import 'package:health_aid_app/util/url_luncher.dart';
import 'package:provider/provider.dart';

import 'find_hospital_model.dart';

class HospitalDetails extends StatelessWidget {
  final HOSPITAL hospital;
  HospitalDetails({this.hospital});

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return ChangeNotifierProvider(
      create: (_) => FindHospitalModel(),
      child: Consumer<FindHospitalModel>(
        builder: (_, FindHospitalModel model, __) => Scaffold(
          // appBar: AppBar(
          //   leading: KBackButton(),
          //   title: Text(hospital.name),
          //   actions: <Widget>[
          //     IconButton(icon: Icon(EvaIcons.moreHorizotnal), onPressed: () {})
          //   ],
          // ),
          body: SingleChildScrollView(
            controller: model.controller,
            child: Column(
              children: <Widget>[
                Header(hospital: hospital),
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
                              title: Text('hospital\'s Name'),
                              trailing: Text(hospital.name),
                            ),
                            ListTile(
                              // leading: GradientIcon(
                              //   icon: Icon(
                              //     EvaIcons.personOutline,
                              //   ),
                              // ),
                              title: Text('Email'),
                              trailing: Text(hospital.contact.email),
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
                              title: Text('Location'),
                              trailing: GestureDetector(
                                ///latitude and longitude
                                onTap: () => Url.launchURL(
                                    'https://www.google.com/maps/search/?api=1&query=47.5951518,-122.3316393'),
                                child: GradientText(
                                  hospital.contact.location,
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
                              trailing: Text(hospital.contact.email),
                            ),
                          ],
                        ),
                      ),
                      ExpansionPanel(
                        isExpanded: model.tile3,
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
    @required this.hospital,
  }) : super(key: key);

  final HOSPITAL hospital;

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
                          'mailto:${hospital.contact.email}?subject=<subject>&body=<body>'),
                    ),
                    Hero(
                      tag: hospital.image,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 70,
                        backgroundImage:
                            CachedNetworkImageProvider(hospital.image),
                      ),
                    ),
                    FloatingActionButton(
                      heroTag: 'call',
                      child: Icon(EvaIcons.phoneCall),
                      mini: true,
                      onPressed: () =>
                          Url.launchURL('tel:${hospital.contact.phone}'),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    hospital.name,
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
                    '${hospital.name}  ',
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
