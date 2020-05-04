import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_aid_app/models/doctor_model.dart';
import 'package:health_aid_app/pages/find_doctor/find_doctor_model.dart';
import 'package:health_aid_app/util/appBar.dart';
import 'package:health_aid_app/util/back_button.dart';
import 'package:health_aid_app/util/gradient_icon.dart';
import 'package:health_aid_app/util/search.dart';
import 'package:health_aid_app/util/spinner.dart';
import 'package:provider/provider.dart';

class FindDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FindDoctorModel(),
      child: Consumer<FindDoctorModel>(builder: (_, model, __) {
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
            itemCount: model.data.doctors.length,
            itemBuilder: (BuildContext context, int index) {
              return DoctorCard(model.data.doctors[index]);
            },
          ),
        );
      }),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final DOCTOR doctor;

  DoctorCard(this.doctor);

  @override
  Widget build(BuildContext context) {
    FindDoctorModel _docModel = Provider.of<FindDoctorModel>(context);
    ThemeData _theme = Theme.of(context);
    return Container(
      child: Card(
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.all(4),
        child: Row(
          children: [
            Container(
              child: Hero(
                tag: doctor.profile,
                child: CachedNetworkImage(
                  width: 130,
                  height: 180,
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
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // FlatButton(
                        //   color: _theme.primaryColor,
                        //   child: Text('BOOK'),
                        //   onPressed: () {},
                        // ),
                        OutlineButton(
                            child: Text('BOOK'),
                            onPressed: () => _docModel.toDetails(doctor))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
