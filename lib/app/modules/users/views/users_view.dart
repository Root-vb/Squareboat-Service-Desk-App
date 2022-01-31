import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/modules/users/controllers/users_controller.dart';
import 'package:starter/app/theme/app_colors.dart';

class UsersView extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: AppColors.primaryBlue,
        ),
      ),
      body: Container(
        child: Center(
          child: Text("data"),
        ),
      ),
    );
  }
}
