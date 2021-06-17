import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:onlineshopping/utils/app_widget.dart';
import 'package:onlineshopping/utils/config_reader.dart';
import 'package:onlineshopping/utils/environment.dart';

String baseURL;
Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigReader.initialize();

  // ignore: unused_local_variable
  Color primaryColor;
  // ignore: unused_local_variable

  switch (env) {
    case Environment.dev:
      baseURL = ConfigReader.getDevURL();
      break;
    case Environment.prod:
      baseURL = ConfigReader.getProdURL();
      break;
  }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(
        GetMaterialApp(
          theme: ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: SpaceXApp(),
        ),
      );
    },
  );
}
