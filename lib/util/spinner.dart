import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Spinner extends StatelessWidget {
  final Color color;
  Spinner({this.color});
  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return SpinKitCircle(
      color: color == null ? _theme.accentColor : color,
      size: 30,
    );
  }
}
