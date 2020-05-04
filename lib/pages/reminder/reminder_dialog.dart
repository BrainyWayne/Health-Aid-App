import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:health_aid_app/pages/reminder/reminder.dart';
import 'package:health_aid_app/pages/reminder/reminder_model.dart';
import 'package:health_aid_app/shared/input_decoration.dart';
import 'package:health_aid_app/util/validators.dart';
import 'package:provider/provider.dart';

class ReminderDialog extends StatelessWidget {
  const ReminderDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ReminderModel model = Provider.of<ReminderModel>(context);
    ThemeData _theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: _theme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(EvaIcons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('ADD REMINDER'),
      ),
      body: ChangeNotifierProvider(
        create: (_) => ReminderModel(_),
        child: Consumer<ReminderModel>(
          builder: (context, model, child) => SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Form(
              key: model.formKey,
              autovalidate: model.autoValidate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Medication',
                      style: _theme.textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    onSaved: (v) => model.reminder.name = v.trim(),
                    validator: Validators.validateNull,
                    decoration:
                        buildInputDecoration(hintText: 'Medication Name'),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Reminders',
                      style: _theme.textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  DropdownButtonFormField<String>(
                      value: model.selectedTime,
                      validator: Validators.validateNull,
                      decoration: buildInputDecoration(
                        hintText: 'Number of times',
                        // padding: EdgeInsets.symmetric(
                        //   horizontal: 10,
                        //   vertical: 8,
                        // ),
                      ),
                      items: model.times
                          .map(
                            (k) => DropdownMenuItem<String>(
                              child: Text(k),
                              value: k,
                            ),
                          )
                          .toList(),
                      onChanged: (value) => model.selectedTime = value),
                  // SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Time',
                                style: _theme.textTheme.subtitle1,
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 100,
                                child: TextFormField(
                                  readOnly: true,
                                  validator: Validators.validateNull,
                                  controller: model.timeController,
                                  textAlign: TextAlign.center,
                                  onTap: () async {
                                    var time =
                                        await model.picker.pickTime(context);

                                    model.setTime(time, context);
                                  },
                                  decoration:
                                      buildInputDecoration(hintText: 'Time'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Dose',
                                style: _theme.textTheme.subtitle1,
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 100,
                                child: TextFormField(
                                  initialValue: '1.0',
                                  validator: Validators.validateNull,
                                  textAlign: TextAlign.center,
                                  onSaved: (v) =>
                                      model.reminder.dose = double.parse(v),
                                  keyboardType: TextInputType.number,
                                  decoration: buildInputDecoration(
                                    hintText: 'Dose',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Schedule',
                      style: _theme.textTheme.subtitle1.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Start',
                                style: _theme.textTheme.subtitle1,
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 130,
                                child: TextFormField(
                                  validator: Validators.validateNull,
                                  readOnly: true,
                                  controller: model.startController,
                                  textAlign: TextAlign.center,
                                  onTap: () async {
                                    var date =
                                        await model.picker.pickDate(context);

                                    model.setStartDate(date, context);
                                  },
                                  decoration:
                                      buildInputDecoration(hintText: 'Time'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'End',
                                style: _theme.textTheme.subtitle1,
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 130,
                                child: TextFormField(
                                  readOnly: true,
                                  validator: Validators.validateNull,
                                  controller: model.endController,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: buildInputDecoration(
                                    hintText: 'Dose',
                                  ),
                                  onTap: () async {
                                    var date =
                                        await model.picker.pickDate(context);

                                    model.setEndDate(date, context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GradientButton(
                    gradient: Gradients.coldLinear,
                    shapeRadius: BorderRadius.circular(10),
                    increaseHeightBy: 18,
                    increaseWidthBy: MediaQuery.of(context).size.width - 120,
                    child: Text('ADD REMINDER'),
                    callback: model.saveReminder,
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
