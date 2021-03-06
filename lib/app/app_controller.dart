import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:starter/app/data/repository/config_repository.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/base/base_controller.dart';
import 'package:starter/utils/storage/storage_utils.dart';
import 'package:starter/widgets/dialog/dialog_widget.dart';

class AppController extends BaseController<ConfigRepository> {
  GoogleSignIn _googleSignIn = GoogleSignIn();

  logout() async {
    await Storage.clearStorage();
    await _googleSignIn.signOut();
    Get.toNamed(Routes.AUTH_LOGIN);
  }

  showLogoutDialog() {
    Get.dialog(DialogWidget(
      title: "Session Expired!",
      text: 'Login Again to continue',
      icon: (Icons.logout),
      isSecondryButtonVisible: true,
      action1: () => Get.back(),
      action2: logout,
      actionText1: "Cancel",
      actionText2: "Sign Out",
    ));
  }

  @override
  void onInit() {
    super.onInit();
    repository.saveAppConfig();
  }
}
