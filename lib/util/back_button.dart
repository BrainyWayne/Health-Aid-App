import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class KBackButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  KBackButton({this.color = Colors.white, this.icon = EvaIcons.arrowBack});
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return BackButton(
        onPressed: () => Navigator.of(context).pop(),
      );
    } else {
      return IconButton(
        color: color,
        icon: Icon(Platform.isIOS ? CupertinoIcons.back : icon),
        onPressed: () => Navigator.of(context).pop(),
      );
    }
  }
}

class KNotification extends StatelessWidget {
  final Color color;
  KNotification({this.color = Colors.pinkAccent});
  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return IconButton(
        color: color,
        icon: Icon(EvaIcons.bellOutline),
        onPressed: () {},
      );
    } else {
      return IconButton(
        color: color,
        icon: Icon(Platform.isIOS ? CupertinoIcons.bell : EvaIcons.bellOutline),
        onPressed: () => Navigator.of(context).pushNamed('/notifications'),
      );
    }
  }
}
