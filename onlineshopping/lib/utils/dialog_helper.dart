import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static void showErrorDialog(
      {String title = 'Error',
      String description = 'Something went wrong, try again.'}) {
    Get.dialog(Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title ?? '',
              style: Get.textTheme.headline4,
            ),
            Text(
              description ?? '',
              textAlign: TextAlign.center,
              style: Get.textTheme.headline6,
            ),
            ElevatedButton(
              onPressed: () {
                if (Get.isDialogOpen) {
                  Get.back();
                }
              },
              child: Text("Okay"),
            ),
          ],
        ),
      ),
    ));
  }

  static void showLoadingDialog([String message]) {
    Get.dialog(
      Dialog(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularProgressIndicator(),
            // message != null && message != ""
            //     ? Text(message)
            //     : Text("Loading..."),
          ],
        ),
      ),
    );
  }

  static void hideLoadingDialog() {
    if (Get.isDialogOpen) Get.back();
  }
}
