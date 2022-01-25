import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingUtils {
  static var isLoaderShowing = false;

  static void showLoader() {
    final spinkit = SpinKitFadingFour(
      color: Colors.white,
      size: 50.0,
    );
    if (!isLoaderShowing) {
      Get.dialog(
        WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: Center(child: spinkit),
        ),
        barrierDismissible: false,
      );
      isLoaderShowing = true;
    }
  }

  static void hideLoader() {
    if (isLoaderShowing) {
      Get.back();
      isLoaderShowing = false;
    }
  }
}
