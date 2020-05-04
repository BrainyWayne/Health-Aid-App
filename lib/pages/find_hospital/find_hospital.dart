import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:health_aid_app/models/hospital_model.dart';
import 'package:health_aid_app/util/appBar.dart';
import 'package:health_aid_app/util/back_button.dart';
import 'package:health_aid_app/util/search.dart';
import 'package:provider/provider.dart';

import 'find_hospital_model.dart';

class FindHospital extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FindHospitalModel(),
      child: Consumer<FindHospitalModel>(builder: (_, model, __) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: buildAppTitle(
              leading: KBackButton(color: Colors.black),
              context: context,
              placeholder: 'Search for doctors',
              trailing: IconButton(
                icon: Icon(EvaIcons.search),
                onPressed: () => showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                ),
              ),
            ),
          ),
          body: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: model.data.hospitals.length,
            itemBuilder: (BuildContext context, int index) {
              return HospitalCard(model.data.hospitals[index]);
            },
          ),
        );
      }),
    );
  }
}

class HospitalCard extends StatelessWidget {
  final HOSPITAL hospital;
  HospitalCard(this.hospital);
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .pushNamed('/hospital_details', arguments: hospital),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: Gradients.coldLinear,
                ),
                child: Image(
                  image: AssetImage('assets/hospital.png'),
                  height: 50,
                  width: 50,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    hospital.name,
                    style: _theme.textTheme.subtitle1,
                    maxLines: 1,
                  ),
                  SizedBox(height: 5),
                  Text(
                    hospital.contact.location,
                    maxLines: 1,
                    style: _theme.textTheme.caption.copyWith(
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    hospital.contact.location,
                    maxLines: 1,
                    style: _theme.textTheme.caption.copyWith(
                      height: 1.5,
                    ),
                  ),
                  // Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: FlatButton(
                  //     onPressed: () {},
                  //     child: Text('MORE'),
                  //   ),
                  // )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
