import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/theme/app_colors.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/service_desk_logo.png',
              height: 40,
            ),
          ),
          SizedBox(height: 30),
          CircularProgressIndicator(
            color: AppColors.lightBlueOpacity100,
          )
        ],
      ),
    );
  }
}
