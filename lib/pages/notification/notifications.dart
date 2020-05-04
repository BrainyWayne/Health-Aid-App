import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:health_aid_app/util/back_button.dart';
import 'package:provider/provider.dart';

import 'notification_model.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return ChangeNotifierProvider<Notificationmodel>(
      create: (context) => Notificationmodel(),
      child: Consumer<Notificationmodel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: KBackButton(
              color: Colors.black,
              icon: EvaIcons.closeOutline,
            ),
            centerTitle: true,
            backgroundColor: _theme.scaffoldBackgroundColor,
            title: Text('Notifications'),
          ),
          body: [].isEmpty ? Empty() : Container(),
        ),
      ),
    );
  }
}

class Empty extends StatelessWidget {
  const Empty({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white60,
            ),
            child: Icon(
              EvaIcons.bellOutline,
              size: 100,
              color: _theme.accentColor,
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: Text(
              'No New Notifications',
              style: _theme.textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
