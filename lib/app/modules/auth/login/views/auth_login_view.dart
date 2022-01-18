import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/modules/auth/login/controllers/auth_login_controller.dart';

class AuthLoginView extends GetView<AuthLoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  // Get.offAllNamed((Routes.HOME));
                  controller.googleLogin();
                },
                child: Container(
                  color: Colors.grey[100],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/google_logo.png",
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Sign in with Google',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     // CustomTextField(
            //     //   wrapper: controller.mobileWrapper,
            //     //   hintText: Strings.mobileNumber,
            //     //   maxLength: 10,
            //     //   inputType: TextInputType.number,
            //     // ),
            //     // SizedBox(height: 8.0),
            //     // PrimaryFilledButton(
            //     //   text: Strings.getOTP,
            //     //   onTap: controller.sendOTP,
            //     // ),

            //   ],
            // ),
            ),
      ),
    );
  }
}
