import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/dto/user.dart';
import 'package:starter/app/data/repository/user_repository.dart';
import 'package:starter/app/routes/app_pages.dart';

import 'package:starter/base/base_controller.dart';
import 'package:starter/utils/storage/storage_utils.dart';
import 'package:starter/widgets/dialog/dialog_widget.dart';

class AuthLoginController extends BaseController {
  UserRepository _userRepository = UserRepository();

  GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['profile', 'email'],
      clientId:
          "123015709778-csfj4f0p5ek2i340m7lrsmk3qld7eu4g.apps.googleusercontent.com");

  googleLogin() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      if (googleAuth.accessToken != null) {
        print(googleAuth.accessToken);
        login(googleAuth.idToken!);
      }
    } catch (error) {
      print(error);
    }
  }

  signOut() async {
    await _googleSignIn.signOut();

    Get.toNamed(Routes.AUTH_LOGIN);
  }

  login(String token) async {
    RepoResponse<User> repoResponse = await _userRepository.login({
      "idToken": token,
    });

    if (repoResponse.error == null) {
      Storage.setUser(repoResponse.data);
      Get.toNamed(Routes.HOME);
    } else {
      if (repoResponse.error?.message == "Your Domain is not registered.") {
        Get.dialog(DialogWidget(
          title: "Your Domain is not registered!",
          text: 'Login Again with your registered domain',
          icon: (Icons.logout),
          isSecondryButtonVisible: false,
          action1: () => Get.back(),
          action2: () async {
            await signOut();
            Get.back();
          },
          actionText1: "Cancel",
          actionText2: "Okay",
        ));
      }
    }
  }
}
