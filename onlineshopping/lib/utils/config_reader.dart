import 'dart:convert';
import 'package:flutter/services.dart';

abstract class ConfigReader {
  static Map<String, dynamic> _config;

  static Future<void> initialize() async {
    final configString = await rootBundle.loadString('config/app_config.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String getDevURL() {
    return _config['devURL'] as String;
  }

  static String getProdURL() {
    return _config['prodURL'] as String;
  }
}
