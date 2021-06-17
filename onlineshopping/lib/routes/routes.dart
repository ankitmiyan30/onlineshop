import 'package:flutter/material.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static const String dashBoard = '/tabView';
  static const String intro = '/intro';
  static const String login = '/loginView';
  static const String addRock = '/addRockView';
  static const String addActivity = '/addActivityView';

  static final routes = <String, WidgetBuilder>{
    // dashBoard: (BuildContext context) => TabWidget(),
    // login: (BuildContext context) => LoginScreen(),
    // addRock: (BuildContext context) => AddRockScreen(),
    // addActivity: (BuildContext context) => AddActivityScreen(),
  };
}
