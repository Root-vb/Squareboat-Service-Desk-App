import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/widgets/buttons/custom_button.dart';
import 'package:starter/widgets/text_field/custom_text_field.dart';

import '../controllers/create_ticket_controller.dart';

class CreateTicketView extends GetView<CreateTicketController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Ticket',
          style: TextStyle(
            color: Color(0xff141322),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: false,
        iconTheme: IconThemeData(color: Color(0xff141322)),
      ),
      body: WillPopScope(child: body(), onWillPop: controller.onWillPop),
    );
  }

  Padding body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Obx(
        () => SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 8,
                  right: 8,
                  bottom: 4,
                ),
                child: Text(
                  "Type",
                  style: TextStyle(color: Color(0xff595C97)),
                ),
              ),
              SizedBox(height: 14),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff595C97),
                        width: 0.2,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: DropdownButton(
                          isExpanded: true,
                          value: controller.updatedValue.value,
                          items: controller.items.map((String items) {
                            return DropdownMenuItem(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  items,
                                  style: TextStyle(color: Color(0xff595C97)),
                                ),
                              ),
                              value: items,
                            );
                          }).toList(),
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 4),
                            child: Icon(
                              Icons.arrow_drop_down,
                              color: Color(0xffC7C4DB),
                            ),
                          ),
                          onChanged: (dynamic value) {
                            controller.updatedValue.value = value;

                            if (controller.updatedValue.value ==
                                "General Ticket") {
                              controller.isGeneralTicket.value = true;
                            } else {
                              controller.isGeneralTicket.value = false;
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 14),
              controller.isGeneralTicket.isTrue
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 8,
                            right: 8,
                            // bottom: 4,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "* ",
                                style: TextStyle(
                                  color: AppColors.red,
                                ),
                              ),
                              Text(
                                "Heading",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: CustomTextField(
                            wrapper: controller.generalHeadingWrapper,
                            fillColor: AppColors.white,
                            textInputAction: TextInputAction.next,
                            hintText: "Heading",
                            hintStyle: TextStyle(color: Color(0xff7578AE)),
                            inputType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 8,
                            right: 8,
                            // bottom: 4,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "* ",
                                style: TextStyle(
                                  color: AppColors.red,
                                ),
                              ),
                              Text(
                                "Description",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: CustomTextField(
                            textInputAction: TextInputAction.next,
                            fillColor: AppColors.white,
                            wrapper: controller.descriptionWrapper,
                            hintText: "Description",
                            hintStyle: TextStyle(color: Color(0xff7578AE)),
                            inputType: TextInputType.text,
                            maxLength: 255,
                            maxLines: 5,
                          ),
                        ),
                        SizedBox(height: 14),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                left: 8,
                                // bottom: 4,
                              ),
                              child: Text(
                                "Watcher Email ",
                                style: TextStyle(color: Color(0xff7376A8)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                left: 2,
                                right: 8,
                                // bottom: 4,
                              ),
                              child: Icon(
                                Icons.info,
                                size: 16,
                                color: Color(0xff595C97),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: CustomTextField(
                            fillColor: AppColors.white,
                            wrapper: controller.generalWatcherEmails,
                            hintText: "Watcher Email",
                            textInputAction: TextInputAction.done,
                            hintStyle: TextStyle(color: Color(0xff7578AE)),
                            inputType: TextInputType.emailAddress,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 8,
                            right: 8,
                            // bottom: 4,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "* ",
                                style: TextStyle(
                                  color: AppColors.red,
                                ),
                              ),
                              Text(
                                "Heading",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: CustomTextField(
                            fillColor: AppColors.white,
                            wrapper: controller.deploymentHeadingWrapper,
                            textInputAction: TextInputAction.next,
                            hintText: "Heading",
                            hintStyle: TextStyle(color: Color(0xff7578AE)),
                            inputType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 8,
                            right: 8,
                            // bottom: 4,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "* ",
                                style: TextStyle(
                                  color: AppColors.red,
                                ),
                              ),
                              Text(
                                "Project Name",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: CustomTextField(
                            fillColor: AppColors.white,
                            textInputAction: TextInputAction.next,
                            wrapper: controller.projectNameWrapper,
                            hintText: "Project Name",
                            hintStyle: TextStyle(color: Color(0xff7578AE)),
                            inputType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 8,
                            right: 8,
                            // bottom: 4,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "* ",
                                style: TextStyle(
                                  color: AppColors.red,
                                ),
                              ),
                              Text(
                                "Project Manager",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: CustomTextField(
                            textInputAction: TextInputAction.next,
                            fillColor: AppColors.white,
                            wrapper: controller.projectManagerWrapper,
                            hintText: "Project Manager",
                            hintStyle: TextStyle(color: Color(0xff7578AE)),
                            inputType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 8,
                            right: 8,
                            // bottom: 4,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "* ",
                                style: TextStyle(
                                  color: AppColors.red,
                                ),
                              ),
                              Text(
                                "Repo Name",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: CustomTextField(
                            textInputAction: TextInputAction.next,
                            fillColor: AppColors.white,
                            wrapper: controller.repoNameWrapper,
                            hintText: "Repo Name",
                            hintStyle: TextStyle(color: Color(0xff7578AE)),
                            inputType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 8,
                            right: 8,
                            // bottom: 4,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "* ",
                                style: TextStyle(
                                  color: AppColors.red,
                                ),
                              ),
                              Text(
                                "Branch Name",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: CustomTextField(
                            textInputAction: TextInputAction.next,
                            fillColor: AppColors.white,
                            wrapper: controller.branchNameWrapper,
                            hintText: "Branch Name",
                            hintStyle: TextStyle(color: Color(0xff7578AE)),
                            inputType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 8,
                            right: 8,
                            // bottom: 4,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "* ",
                                style: TextStyle(
                                  color: AppColors.red,
                                ),
                              ),
                              Text(
                                "Release Priority",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff595C97),
                                width: 0.2,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                hint: Text(
                                  "Release Priority",
                                  style: TextStyle(color: Color(0xff595C97)),
                                ),
                                value: controller.releasePriorityValue.value,
                                items: controller.releasePriority
                                    .map((String val) {
                                  return DropdownMenuItem(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        val,
                                        style:
                                            TextStyle(color: Color(0xff595C97)),
                                      ),
                                    ),
                                    value: val,
                                  );
                                }).toList(),
                                icon: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Color(0xffC7C4DB),
                                  ),
                                ),
                                onChanged: (dynamic value) {
                                  controller.releasePriorityValue.value = value;
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 8,
                            right: 8,
                            // bottom: 4,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "* ",
                                style: TextStyle(
                                  color: AppColors.red,
                                ),
                              ),
                              Text(
                                "Release Notes",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: CustomTextField(
                            fillColor: AppColors.white,
                            textInputAction: TextInputAction.next,
                            wrapper: controller.releaseNotesWrapper,
                            hintText: "Release Notes",
                            hintStyle: TextStyle(color: Color(0xff7578AE)),
                            inputType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 8,
                            right: 8,
                            // bottom: 4,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "* ",
                                style: TextStyle(
                                  color: AppColors.red,
                                ),
                              ),
                              Text(
                                "Deployment Steps",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: CustomTextField(
                            fillColor: AppColors.white,
                            textInputAction: TextInputAction.next,
                            wrapper: controller.deploymentStepsWrapper,
                            hintText: "Deployment Steps",
                            hintStyle: TextStyle(color: Color(0xff7578AE)),
                            inputType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 8,
                            right: 8,
                            // bottom: 4,
                          ),
                          child: Row(
                            children: [
                              Text(
                                "* ",
                                style: TextStyle(
                                  color: AppColors.red,
                                ),
                              ),
                              Text(
                                "Environment",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff595C97),
                                width: 0.2,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                isExpanded: true,
                                hint: Text("Enviroment"),
                                value: controller.enviromentsValue.value,
                                items: controller.enviromentsList
                                    .map((String val) {
                                  return DropdownMenuItem(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        val,
                                        style: TextStyle(
                                          color: Color(0xff595C97),
                                        ),
                                      ),
                                    ),
                                    value: val,
                                  );
                                }).toList(),
                                icon: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    color: Color(0xffC7C4DB),
                                  ),
                                ),
                                onChanged: (dynamic value) {
                                  controller.enviromentsValue.value = value;
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 14),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                            left: 8,
                            right: 8,
                            // bottom: 4,
                          ),
                          child: Text(
                            "Participants",
                            style: TextStyle(
                              color: Color(0xff595C97),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xff595C97),
                                width: 0.2,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: Obx(
                                () => DropdownButton(
                                  isExpanded: true,
                                  hint: Text("Participants"),
                                  value: controller.selectedParticipants.value,
                                  items: controller.participantsList.map((val) {
                                    return DropdownMenuItem(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          val.name ?? "",
                                          style: TextStyle(
                                            color: Color(0xff595C97),
                                          ),
                                        ),
                                      ),
                                      value: val.name,
                                    );
                                  }).toList(),
                                  icon: Padding(
                                    padding: const EdgeInsets.only(right: 4),
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      color: Color(0xffC7C4DB),
                                    ),
                                  ),
                                  onChanged: (String? value) {
                                    controller.selectedParticipants.value =
                                        value ?? "";
                                    controller.selectedVal.add(value);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 14),
                        Obx(
                          () => Wrap(
                            direction: Axis.horizontal,
                            children: List.generate(
                              controller.selectedVal.length,
                              (index) => Chip(
                                label:
                                    Text(controller.selectedVal[index] ?? ""),
                                backgroundColor: Color(0xffEFF2F4),
                                elevation: 1,
                                onDeleted: () {
                                  print(controller.selectedVal.remove(index));
                                  controller.selectedVal.removeAt(index);
                                },
                              ),
                            ),
                            spacing: 10,
                          ),
                        ),
                        SizedBox(height: 14),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                left: 8,
                                // bottom: 4,
                              ),
                              child: Text(
                                "Watcher Email ",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, right: 8, left: 4),
                              child: Icon(
                                Icons.info,
                                size: 16,
                                color: Color(0xff595C97),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: CustomTextField(
                            fillColor: AppColors.white,
                            textInputAction: TextInputAction.done,
                            wrapper: controller.deploymentWatcherEmails,
                            hintText: "Watcher Email",
                            hintStyle: TextStyle(color: Color(0xff7578AE)),
                            inputType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
              SizedBox(height: 15),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                child: CustomButton(
                  buttonName: "Create New",
                  onPressed: () => controller.createTicket(),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
