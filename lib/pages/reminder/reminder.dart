import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:health_aid_app/models/reminder.dart';
import 'package:health_aid_app/pages/reminder/reminder_dialog.dart';
import 'package:health_aid_app/pages/reminder/reminder_model.dart';
import 'package:health_aid_app/shared/input_decoration.dart';
import 'package:health_aid_app/util/back_button.dart';
import 'package:health_aid_app/util/spinner.dart';
import 'package:provider/provider.dart';

class Reminder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return ChangeNotifierProvider<ReminderModel>(
      create: (context) => ReminderModel(context),
      child: Consumer<ReminderModel>(
        builder: (context, model, child) => Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () => showDialog(
                context: context, builder: (context) => ReminderDialog()),
            child: Icon(EvaIcons.plus),
          ),
          appBar: AppBar(
            elevation: 0,
            leading: KBackButton(
              color: Colors.black,
            ),
            centerTitle: true,
            backgroundColor: _theme.scaffoldBackgroundColor,
            title: Text('Meds Reminders'),
            actions: <Widget>[KNotification()],
          ),
          body: StreamBuilder<List<REMINDER>>(
            stream: model.getReminders(),
            builder:
                (BuildContext context, AsyncSnapshot<List<REMINDER>> snapshot) {
              if (snapshot.hasData) {
                List<REMINDER> data = snapshot.data;

                if (data.isEmpty) {
                  return Empty();
                } else {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(title: Text(data[index].name));
                    },
                  );
                }
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else {
                return Spinner();
              }
            },
          ),
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
              EvaIcons.bookmarkOutline,
              size: 100,
              color: _theme.accentColor,
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: Text(
              'Add new medication',
              style: _theme.textTheme.headline5,
            ),
          ),
          Container(
            child: Text(
              'Seems like your medications list is empyt\nTap on the + button to add add',
              textAlign: TextAlign.center,
              style: _theme.textTheme.caption.copyWith(
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
