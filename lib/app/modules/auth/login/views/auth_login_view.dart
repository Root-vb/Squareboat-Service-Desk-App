import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:starter/app/modules/auth/login/controllers/auth_login_controller.dart';
import 'package:starter/app/theme/styles.dart';

class AuthLoginView extends GetView<AuthLoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height / 1.4,
                    child: logo(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: InkWell(
                      onTap: () {
                        controller.googleLogin();
                      },
                      child: googleButton(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center logo() {
    return Center(
      child: Image.asset(
        'assets/images/service_desk_logo.png',
        height: 40,
      ),
    );
  }

  Widget googleButton() {
    return Container(
      height: 40,
      color: Color(0xFF4284F3),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, top: 4, bottom: 4),
            child: Container(
              width: 48,
              height: 35,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  "assets/images/google_logo.png",
                  height: 20,
                  width: 25,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 8),
            child: Container(
              child: Text(
                'Sign in with Google',
                style: Styles.tsWhiteColorBold18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
