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
                return ListTile(
                  title: Text(
                    controller.usersList[index].name ?? "",
                    style: Styles.tsprimaryBlueSemiBold14,
                  ),
                  trailing: Obx(
                    () => IconButton(
                      onPressed: () {
                        controller.isChecked.add(index);
                      },
                      icon: controller.isChecked.contains(index)
                          ? Icon(
                              Icons.check_box,
                              color: Theme.of(context).iconTheme.color,
                            )
                          : Icon(
                              Icons.check_box_outline_blank,
                              color: Theme.of(context).iconTheme.color,
                            ),
                    ),
                  ),
                );
              },
            ),
            Center(
                child: MaterialButton(
              onPressed: () {
                controller.addPartcipantsPerformAction();
                Get.back(result: true);
              },
              child: Text("Done"),
            ))
          ],
        ),
      ),
    );
  }
}
/**
 * Wrap(
        direction: Axis.horizontal,
        children: List.generate(
          controller.usersList.length,
          (index) => Chip(
            label: Text(controller.usersList[index].name ?? ""),
            backgroundColor: Color(0xffEFF2F4),
            elevation: 1,
          ),
        ),
        spacing: 5,
      ),
 */
