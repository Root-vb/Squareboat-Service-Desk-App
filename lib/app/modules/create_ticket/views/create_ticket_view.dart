import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/ticket_dto.dart';
import 'package:starter/app/routes/app_pages.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Form(
          key: controller.formKey,
          child: Obx(
            () => SingleChildScrollView(
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
                  SizedBox(height: 5),
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
                                      style:
                                          TextStyle(color: Color(0xff595C97)),
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
                  SizedBox(height: 8),
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
                              child: Text(
                                "Heading",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: CustomTextField(
                                wrapper: controller.generalHeadingWrapper,
                                hintText: "Heading",
                                hintStyle: TextStyle(color: Color(0xff7578AE)),
                                inputType: TextInputType.text,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                left: 8,
                                right: 8,
                                // bottom: 4,
                              ),
                              child: Text(
                                "Description",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: CustomTextField(
                                wrapper: controller.descriptionWrapper,
                                hintText: "Description",
                                hintStyle: TextStyle(color: Color(0xff7578AE)),
                                inputType: TextInputType.text,
                              ),
                            ),
                            SizedBox(height: 5),
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
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: CustomTextField(
                                wrapper: controller.generalWatcherEmails,
                                hintText: "Watcher Email",
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
                              child: Text(
                                "Heading",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: CustomTextField(
                                wrapper: controller.generalHeadingWrapper,
                                hintText: "Heading",
                                hintStyle: TextStyle(color: Color(0xff7578AE)),
                                inputType: TextInputType.text,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                left: 8,
                                right: 8,
                                // bottom: 4,
                              ),
                              child: Text(
                                "Project Name",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: CustomTextField(
                                wrapper: controller.projectNameWrapper,
                                hintText: "Project Name",
                                hintStyle: TextStyle(color: Color(0xff7578AE)),
                                inputType: TextInputType.text,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                left: 8,
                                right: 8,
                                // bottom: 4,
                              ),
                              child: Text(
                                "Project Manager",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: CustomTextField(
                                wrapper: controller.projectManagerWrapper,
                                hintText: "Project Manager",
                                hintStyle: TextStyle(color: Color(0xff7578AE)),
                                inputType: TextInputType.text,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                left: 8,
                                right: 8,
                                // bottom: 4,
                              ),
                              child: Text(
                                "Repo Name",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: CustomTextField(
                                wrapper: controller.repoNameWrapper,
                                hintText: "Repo Name",
                                hintStyle: TextStyle(color: Color(0xff7578AE)),
                                inputType: TextInputType.text,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                left: 8,
                                right: 8,
                                // bottom: 4,
                              ),
                              child: Text(
                                "Branch Name",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: CustomTextField(
                                wrapper: controller.branchNameWrapper,
                                hintText: "Branch Name",
                                hintStyle: TextStyle(color: Color(0xff7578AE)),
                                inputType: TextInputType.text,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                left: 8,
                                right: 8,
                                // bottom: 4,
                              ),
                              child: Text(
                                "Release Priority",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
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
                                      style:
                                          TextStyle(color: Color(0xff595C97)),
                                    ),
                                    value:
                                        controller.releasePriorityValue.value,
                                    items: controller.releasePriority
                                        .map((String val) {
                                      return DropdownMenuItem(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            val,
                                            style: TextStyle(
                                                color: Color(0xff595C97)),
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
                                      controller.releasePriorityValue.value =
                                          value;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                left: 8,
                                right: 8,
                                // bottom: 4,
                              ),
                              child: Text(
                                "Release Notes",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: CustomTextField(
                                wrapper: controller.releaseNotesWrapper,
                                hintText: "Release Notes",
                                hintStyle: TextStyle(color: Color(0xff7578AE)),
                                inputType: TextInputType.text,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                left: 8,
                                right: 8,
                                // bottom: 4,
                              ),
                              child: Text(
                                "Deployment Steps",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: CustomTextField(
                                wrapper: controller.deploymentStepsWrapper,
                                hintText: "Deployment Steps",
                                hintStyle: TextStyle(color: Color(0xff7578AE)),
                                inputType: TextInputType.text,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 8,
                                left: 8,
                                right: 8,
                                // bottom: 4,
                              ),
                              child: Text(
                                "Environment",
                                style: TextStyle(color: Color(0xff595C97)),
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
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
                            SizedBox(height: 5),
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
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
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
                                    hint: Text("Participants"),
                                    value:
                                        controller.selectedParticipants.value,
                                    items: controller.participantsList
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
                                      controller.selectedParticipants.value =
                                          value;

                                      controller.selectedVal.add(value);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Wrap(
                              direction: Axis.horizontal,
                              children: List.generate(
                                controller.selectedVal.length,
                                (index) => Chip(
                                  label: Text(controller.selectedVal[index]),
                                  backgroundColor: Color(0xffEFF2F4),
                                  elevation: 1,
                                ),
                              ),
                              spacing: 5,
                            ),
                            SizedBox(height: 5),
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
                            SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: CustomTextField(
                                wrapper: controller.deploymentWatcherEmails,
                                hintText: "Watcher Email",
                                hintStyle: TextStyle(color: Color(0xff7578AE)),
                                inputType: TextInputType.emailAddress,
                              ),
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: CustomButton(
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
 // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.all(Radius.circular(12)),
                  //     child: MaterialButton(
                  //       elevation: 5,
                  //       onPressed: () {
                  //         Get.offAllNamed(
                  //           Routes.HOME,
                  //           arguments: TicketDto(
                  //             heading: controller
                  //                 .generalHeadingWrapper.controller.text,
                  //             id: "#45363",
                  //             type: controller.updatedValue.value,
                  //             status: "status",
                  //             date: "5/01/2022",
                  //           ),
                  //         );
                  //       },
                  //       child: Row(
                  //         mainAxisSize: MainAxisSize.min,
                  //         children: [
                  //           Container(
                  //             color: Color(0xff6DC79C),
                  //             child: Icon(
                  //               CupertinoIcons.add_circled,
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //           SizedBox(width: 8),
                  //           Text(
                  //             "Create Ticket",
                  //             style: TextStyle(color: Colors.white),
                  //           ),
                  //         ],
                  //       ),
                  //       color: Color(0xff3FB883),
                  //     ),
                  //   ),
                  // )