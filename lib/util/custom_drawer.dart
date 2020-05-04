import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:health_aid_app/pages/drawer.dart';

class CustomDrawer extends StatefulWidget {
  final Widget child;
  final Function function;
  CustomDrawer({this.child, this.function});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  double mSlide = 300;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
  }

  toggle() => _animationController.isDismissed
      ? _animationController.forward()
      : _animationController.reverse();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          double slide = mSlide * _animationController.value;
          double scale = 1 - _animationController.value * 0.3;
          return Stack(
            children: <Widget>[
              NavDrawer(),
              GestureDetector(
                onTap: toggle,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(slide)
                    ..scale(scale),
                  alignment: Alignment.centerLeft,
                  child: widget.child,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
