import 'package:flutter/cupertino.dart';
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
      body: SingleChildScrollView(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                CupertinoSearchTextField(
                  controller: controller.searchController,
                  backgroundColor: AppColors.darkWhite,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  style: Styles.tsPrimaryColorRegular14,
                  onSubmitted: (value) {
                    controller.searchController.text = value;
                  },
                ),
                SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.participantsList.length,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => CheckboxListTile(
                        title: Text(
                          controller.participantsList[index].name ?? "",
                          style: Styles.tsPrimaryColorRegular14,
                        ),
                        value: controller.users
                            .contains(controller.participantsList[index].id),
                        onChanged: (bool? value) {
                          controller.addUser(index, value);
                        },
                        activeColor: AppColors.darkGrey,
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
        ),
      ),
    );
  }
}
