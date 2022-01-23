import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:starter/app/theme/app_colors.dart';

import '../controllers/showcomments_controller.dart';

class ShowcommentsView extends GetView<ShowcommentsController> {
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
      body: Center(
        child: Text(
          'ShowcommentsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
