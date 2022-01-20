import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import '../controllers/users_controller.dart';

class UsersView extends GetView<UsersController> {
  static toLaunch(String uid) {}

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
      body: Obx(
        () => Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: controller.usersList.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => CheckboxListTile(
                    title: Text(
                      controller.usersList[index].name ?? "",
                      style: Styles.tsprimaryBlueSemiBold14,
                    ),
                    value: controller.users
                        .contains(controller.usersList[index].id),
                    onChanged: (bool? value) {
                      controller.addUser(index, value);
                    },
                  ),
                );
              },
            ),
            Center(
                child: MaterialButton(
              onPressed: () {
                controller.onBackPressed();
              },
              child: Text("Done"),
            ))
          ],
        ),
      ),
    );
  }
}
