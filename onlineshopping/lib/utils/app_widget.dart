import 'package:flutter/material.dart';
import 'package:onlineshopping/screens/homepage.dart';
import 'package:onlineshopping/utils/app_theme.dart';
import '../routes/routes.dart';

class SpaceXApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeDataFactory.prepareThemeData(),
      home: HomePage(),
      routes: Routes.routes,
    );
  }
}
