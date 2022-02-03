import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/modules/profile/profile_controller.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/widgets/cached_netwrok_image_utils.dart';
import 'package:starter/widgets/text_field/custom_text_field.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: Styles.tsPrimaryColorSemiBold17,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImageProviderUtils(
                  imageUrl: controller.profilePicture.value,
                  height: 160,
                  width: 160,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 8,
                    right: 8,
                    bottom: 4,
                  ),
                  child: Text(
                    "Name",
                    style: TextStyle(color: Color(0xff595C97)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CustomTextField(
                    wrapper: controller.nameWrapper,
                    fillColor: AppColors.white,
                    textInputAction: TextInputAction.next,
                    hintText: "Name",
                    hintStyle: TextStyle(color: Color(0xff7578AE)),
                    inputType: TextInputType.text,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 8,
                    right: 8,
                    bottom: 4,
                  ),
                  child: Text(
                    "Email",
                    style: TextStyle(color: Color(0xff595C97)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CustomTextField(
                    wrapper: controller.emailWrapper,
                    textInputAction: TextInputAction.next,
                    hintText: "Email",
                    fillColor: AppColors.filledWhiteColor,
                    readOnly: true,
                    hintStyle: TextStyle(color: Color(0xff7578AE)),
                    inputType: TextInputType.text,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 8,
                    right: 8,
                    bottom: 4,
                  ),
                  child: Text(
                    "Status",
                    style: TextStyle(color: Color(0xff595C97)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CustomTextField(
                    fillColor: AppColors.filledWhiteColor,
                    wrapper: controller.statusWrapper,
                    textInputAction: TextInputAction.next,
                    hintText: "Status",
                    readOnly: true,
                    hintStyle: TextStyle(color: Color(0xff7578AE)),
                    inputType: TextInputType.text,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 8,
                    right: 8,
                    bottom: 4,
                  ),
                  child: Text(
                    "Organization",
                    style: TextStyle(color: Color(0xff595C97)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CustomTextField(
                    wrapper: controller.oragnizationWrapper,
                    fillColor: AppColors.filledWhiteColor,
                    textInputAction: TextInputAction.next,
                    hintText: "Organization",
                    readOnly: true,
                    hintStyle: TextStyle(color: Color(0xff7578AE)),
                    inputType: TextInputType.text,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 8,
                    right: 8,
                    bottom: 4,
                  ),
                  child: Text(
                    "Role",
                    style: TextStyle(color: Color(0xff595C97)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CustomTextField(
                    wrapper: controller.roleWrapper,
                    fillColor: AppColors.filledWhiteColor,
                    textInputAction: TextInputAction.next,
                    hintText: "Role",
                    readOnly: true,
                    hintStyle: TextStyle(color: Color(0xff7578AE)),
                    inputType: TextInputType.text,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 8,
                    right: 8,
                    bottom: 4,
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.updateProfile();
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
                            "Save",
                            style: Styles.tsWhiteSemiBold12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
