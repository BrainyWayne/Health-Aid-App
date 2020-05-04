import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:health_aid_app/pages/emergency/emergency_model.dart';
import 'package:health_aid_app/shared/input_decoration.dart';
import 'package:health_aid_app/util/back_button.dart';
import 'package:health_aid_app/util/gradient_icon.dart';
import 'package:provider/provider.dart';

class Emergency extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return ChangeNotifierProvider<EmergencyModel>(
      create: (_) => EmergencyModel(),
      child: Consumer<EmergencyModel>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: _theme.scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            leading: KBackButton(
              color: Colors.black,
            ),
            title: Text('Emergency'),
            actions: <Widget>[KNotification()],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: buildInputDecoration(
                    hintText: 'What\'s the emergency',
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  maxLines: 5,
                  decoration: buildInputDecoration(
                    hintText: 'Add a Message',
                  ),
                ),
                SizedBox(height: 20),
                GradientButton(
                  gradient: Gradients.coldLinear,
                  shapeRadius: BorderRadius.circular(10),
                  increaseHeightBy: 20,
                  increaseWidthBy: MediaQuery.of(context).size.width - 120,
                  child: Text('SEND EMERGENCY'),
                  callback: () {},
                ),
                SizedBox(height: 20),
                Row(children: [
                  Expanded(child: Divider()),
                  SizedBox(width: 10),
                  Text('EMERGENCY LINES'),
                  SizedBox(width: 10),
                  Expanded(child: Divider()),
                ]),
                ListTile(
                  title: Text('Ambulance'),
                  trailing: GradientIcon(
                    gradient: Gradients.rainbowBlue,
                    icon: IconButton(
                      color: Colors.white,
                      icon: Icon(EvaIcons.phoneCall),
                      onPressed: () {},
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Police'),
                  trailing: GradientIcon(
                    gradient: Gradients.rainbowBlue,
                    icon: IconButton(
                      color: Colors.white,
                      icon: Icon(EvaIcons.phoneCall),
                      onPressed: () {},
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Fire Service'),
                  trailing: GradientIcon(
                    gradient: Gradients.rainbowBlue,
                    icon: IconButton(
                      color: Colors.white,
                      icon: Icon(EvaIcons.phoneCall),
                      onPressed: () {},
                    ),
                  ),
                ),
                ListTile(
                  title: Text('Get Assistance'),
                  trailing: GradientIcon(
                    gradient: Gradients.rainbowBlue,
                    icon: IconButton(
                      color: Colors.white,
                      icon: Icon(EvaIcons.phoneCall),
                      onPressed: () {},
                    ),
                  ),
                ),
                Text(
                  'Use health assistance to get first aid help in case someone is seriously hurt',
                  textAlign: TextAlign.center,
                  style: _theme.textTheme.caption.copyWith(
                    fontSize: 9,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
