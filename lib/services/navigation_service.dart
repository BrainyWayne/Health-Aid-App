import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {args}) {
    return navigationKey.currentState.pushNamed(
      routeName,
      arguments: args,
    );
  }

  Future<dynamic> moveTo(String routeName, {args}) {
    return navigationKey.currentState.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: args,
    );
  }

  replaceWith(String routeName, {args}) => navigationKey.currentState
      .pushReplacementNamed(routeName, arguments: args);

  navigateBack() => navigationKey.currentState.pop();
}
