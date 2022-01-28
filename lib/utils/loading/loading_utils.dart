import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/widgets/dialog/dialog_widget.dart';

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

  serverNotAvilableDialog() {
    Get.snackbar(
      "Service Unavailable!",
      "The server is temporarily unable to service you request due to maintenance downtime or capacity problems. Please try again later.",
      backgroundColor: AppColors.darkWhite,
      snackPosition: SnackPosition.BOTTOM,
      colorText: AppColors.primaryColor,
    );
  }

  connectionTimedOut() {
    Get.dialog(DialogWidget(
      title: "Connection timed out",
      text: 'Please check your internet connection',
      icon: (Icons.logout),
      isSecondryButtonVisible: true,
      action1: () => Get.back(),
      action2: () {
        Get.back();
      },
      actionText1: "Okay",
      actionText2: "Okay",
    ));
  }
}
