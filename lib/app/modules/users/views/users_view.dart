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
                    controller.onSearchTextChanged(value, context);
                  },
                  onChanged: (String text) {
                    controller.onSearchTextChanged(text, context);
                  },
                ),
                SizedBox(height: 20),
                Wrap(
                  direction: Axis.horizontal,
                  children: List.generate(
                    controller.selectedUser.length,
                    (index) => Chip(
                      label: Text(
                        controller.selectedUser[index],
                        style: Styles.tsPrimaryColorRegular12,
                      ),
                      backgroundColor: Color(0xffEFF2F4),
                      elevation: 1,
                      onDeleted: () {
                        controller.addUser(index, false);
                      },
                    ),
                  ),
                  spacing: 5,
                ),
                SizedBox(height: 20),
                !controller.showSearchResult.value
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.participantsList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Obx(
                            () => CheckboxListTile(
                              title: Text(
                                controller.participantsList[index].name ?? "",
                                style: Styles.tsPrimaryColorRegular14,
                              ),
                              value: controller.users.contains(
                                  controller.participantsList[index].id),
                              onChanged: (bool? value) {
                                controller.addUser(index, value);
                              },
                              activeColor: AppColors.darkGrey,
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.searchList.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Obx(
                            () => CheckboxListTile(
                              title: Text(
                                controller.searchList[index].name ?? "",
                                style: Styles.tsPrimaryColorRegular14,
                              ),
                              value: controller.users
                                  .contains(controller.searchList[index].id),
                              onChanged: (bool? value) {
                                int newIndex = 0;

                                for (var i = 0;
                                    i < controller.participantsList.length;
                                    i++) {
                                  if (controller.participantsList[i].name ==
                                      controller.searchList[index].name) {
                                    newIndex = i;
                                  }
                                }
                                controller.addUser(newIndex, value);
                              },
                              activeColor: AppColors.darkGrey,
                            ),
                          );
                        },
                      ),
                SizedBox(height: 20),
                Center(
                  child: InkWell(
                    onTap: () {
                      controller.onBackPressed();
                    },
                    child: Container(
                      width: 65,
                      height: 29,
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Center(
                          child: Text(
                            "Done",
                            style: Styles.tsWhiteSemiBold12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
