import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/widgets/update_section.dart';

import '../controllers/showupdate_controller.dart';

class ShowupdateView extends GetView<ShowupdateController> {
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
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: SingleChildScrollView(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.allUpdatesList.length,
              itemBuilder: (context, index) {
                print(controller.allUpdatesList.length);
                var data = controller.allUpdatesList[index];
                DateTime time = DateTime.parse(data.updatedAt ?? "");
                return Column(
                  children: [
                    UpdatesSection(
                      name: data.updatedBy?.name ?? "",
                      fieldName: data.fieldName ?? "",
                      newValue: data.newValue ?? "",
                      time: time,
                    ),
                    SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
