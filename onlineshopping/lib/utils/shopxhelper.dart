import 'package:flutter/material.dart';

abstract class ShopXHelper {
  static unFoucsKeyBoard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    currentFocus.unfocus();
  }

  static String getInitials(String brandname) => brandname.isNotEmpty
      ? brandname.trim().split(' ').map((l) => l[0]).take(2).join()
      : 'NO';
  static String capitalize(String string) =>
      string[0].toUpperCase() + string.substring(1);
}
