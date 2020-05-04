import 'package:flutter/material.dart';
import 'package:health_aid_app/util/back_button.dart';
import 'package:provider/provider.dart';

import './records_model.dart';

class Records extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return ChangeNotifierProvider<RecordsModel>(
      create: (context) => RecordsModel(),
      child: Consumer<RecordsModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: KBackButton(
              color: Colors.black,
            ),
            centerTitle: true,
            backgroundColor: _theme.scaffoldBackgroundColor,
            title: Text('Health Records'),
            actions: <Widget>[KNotification()],
          ),
        ),
      ),
    );
  }
}
