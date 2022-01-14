import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/widgets/cached_netwrok_image_utils.dart';
import '../controllers/ticket_controller.dart';

class TicketView extends GetView<TicketController> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              SizedBox(height: 40),
              dropDown(),
              SizedBox(height: 30),
              testingProjectCard(),
              SizedBox(height: 40),
              Text("People Involved", style: Styles.tsPrimaryBlueSemiBold18),
              SizedBox(height: 25),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Color(0xffECECEC),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Participants ",
                            style: Styles.tsPrimaryColorSemiBold16,
                          ),
                          Icon(
                            CupertinoIcons.add_circled_solid,
                            color: AppColors.primaryBlue,
                            size: 16,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          CachedNetworkImageProviderUtils(
                            imageUrl: controller.profilePic ?? " ",
                            height: 40,
                            width: 40,
                          ),
                          SizedBox(width: 10),
                          Text(
                            controller.name ?? "",
                            style: Styles.tsprimaryBlueSemiBold16,
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Assigned to",
                        style: Styles.tsPrimaryColorSemiBold16,
                      ),
                      SizedBox(height: 10),
                      Obx(
                        () => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: assignedToDropDown(),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Created By",
                        style: Styles.tsPrimaryColorSemiBold16,
                      ),
                      SizedBox(height: 15),
                      CachedNetworkImageProviderUtils(
                        imageUrl: controller.profilePic ?? "",
                        height: 32,
                        width: 32,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Updates",
                        style: Styles.tsPrimaryColorSemiBold16,
                      ),
                      SizedBox(height: 15),
                      updatesSection(),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CachedNetworkImageProviderUtils(
                    imageUrl: controller.profilePic ?? "",
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: AppColors.grey,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(7.0),
                        ),
                      ),
                      child: TextField(
                        controller: controller.commentController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: "  Post a comment...",
                          border: InputBorder.none,
                          hintStyle: Styles.tsPrimaryColorSemiBold14.copyWith(
                            color: AppColors.primaryColor.withOpacity(0.37),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
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
                        "Post",
                        style: Styles.tsWhiteSemiBold12,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container assignedToDropDown() {
    return Container(
      child: DropdownButtonHideUnderline(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: DropdownButton(
            isExpanded: true,
            value: controller.selectedParticipants.value,
            items: controller.participantsList.map((String items) {
              return DropdownMenuItem(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    items,
                    style: Styles.tsPrimaryIndigoSemiBold14,
                  ),
                ),
                value: items,
              );
            }).toList(),
            icon: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(
                Icons.arrow_drop_down,
                color: AppColors.primaryIndigo,
              ),
            ),
            onChanged: (dynamic value) {
              controller.selectedParticipants.value = value;

              // if (controller.updatedValue.value ==
              //     "General Ticket") {
              //   controller.isGeneralTicket.value = true;
              // } else {
              //   controller.isGeneralTicket.value = false;
              // }
            },
          ),
        ),
      ),
    );
  }

  IntrinsicHeight updatesSection() {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 4,
            color: AppColors.green,
          ), // This is divider
          SizedBox(width: 4),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ticket Updated", style: Styles.tsPrimaryColorSemiBold14),
                Row(
                  children: [
                    Text(
                      "By Nimish Dawar ",
                      style: Styles.tsprimaryIndigoSemiBold12,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Container(
                            width: 1,
                            color: AppColors.green,
                          ),
                          Text(
                            " few sec ago",
                            style: Styles.tsprimaryIndigoSemiBold12,
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container testingProjectCard() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: Color(0xffECECEC),
          ),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "SQB-14",
                  style: Styles.tsPrimaryBlueBold18,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipOval(
                      child: Container(
                        color: AppColors.red,
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Icon(
                            CupertinoIcons.delete,
                            color: AppColors.white,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Delete", style: Styles.tsRedSemiBold14),
                    ),
                  ],
                ),
              ],
            ),
            Text("Testing Project", style: Styles.tsPrimaryColorSemiBold16),
            // TextButton(
            //   onPressed: () {},
            //   child: Text("Delete", style: Styles.tsRedSemiBold14),
            // ),
            Divider(color: Color(0xffEEF2F8), thickness: 2),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Type",
                  style: Styles.tsprimaryIndigoSemiBold12,
                ),
                Text(
                  "Deployment Ticket",
                  style: Styles.tsPrimaryColorRegular12,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Project Name",
                  style: Styles.tsprimaryIndigoSemiBold12,
                ),
                Text(
                  "Test 1",
                  style: Styles.tsPrimaryColorRegular12,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Project Manager",
                  style: Styles.tsprimaryIndigoSemiBold12,
                ),
                Text(
                  "Nimish Dawar",
                  style: Styles.tsPrimaryColorRegular12,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Repo Name",
                  style: Styles.tsprimaryIndigoSemiBold12,
                ),
                Text(
                  "Test Repo",
                  style: Styles.tsPrimaryColorRegular12,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Release Priority",
                  style: Styles.tsprimaryIndigoSemiBold12,
                ),
                Text(
                  "PO - Service Downtime",
                  style: Styles.tsPrimaryColorRegular12,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Enviroment",
                  style: Styles.tsprimaryIndigoSemiBold12,
                ),
                Text(
                  "Testing for developers and QA",
                  style: Styles.tsPrimaryColorRegular12,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Release Notes",
                  style: Styles.tsprimaryIndigoSemiBold12,
                ),
                Text(
                  "Patch 1.0",
                  style: Styles.tsPrimaryColorRegular12,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Deployment Steps",
                  style: Styles.tsprimaryIndigoSemiBold12,
                ),
                Text(
                  "1,2,3",
                  style: Styles.tsPrimaryColorRegular12,
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Container dropDown() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        border: Border.all(
          color: Color(0xff595C97),
          width: 0.2,
        ),
        borderRadius: BorderRadius.circular(21.0),
      ),
      child: DropdownButtonHideUnderline(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
          ),
          child: DropdownButton(
            dropdownColor: AppColors.primaryBlue,
            focusColor: Colors.red,
            isExpanded: false,
            value: controller.updatedValue.value,
            items: controller.items.map((String items) {
              return DropdownMenuItem(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    items,
                    style: Styles.tsWhiteRegular12,
                  ),
                ),
                value: items,
              );
            }).toList(),
            icon: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
            ),
            onChanged: (dynamic value) {
              controller.updatedValue.value = value;
            },
          ),
        ),
      ),
    );
  }

  Row header() {
    return Row(
      children: [
        CachedNetworkImageProviderUtils(
          imageUrl: controller.profilePic ?? "",
          height: 44,
          width: 44,
        ),
        SizedBox(width: 15),
        Text(
          controller.name ?? "",
          style: Styles.tsPrimaryColorSemiBold18,
        ),
      ],
    );
  }
}
