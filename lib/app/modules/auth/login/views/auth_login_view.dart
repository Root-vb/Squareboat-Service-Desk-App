import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/modules/auth/login/controllers/auth_login_controller.dart';

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
    return Image.asset(
      'assets/images/bg_img_google.png',
      height: 60,
      width: 184,
    );
  }
}
