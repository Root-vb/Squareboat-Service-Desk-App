import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/comment.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/widgets/cached_netwrok_image_utils.dart';
import 'package:starter/widgets/comment_box_util.dart';
import 'package:starter/widgets/update_section.dart';
import '../controllers/ticket_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

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
              controller.description == null
                  ? deploymentProjectCard()
                  : generalProjectCard(),
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
                      // SizedBox(height: 20),
                      Text(
                        "Created By",
                        style: Styles.tsPrimaryColorSemiBold16,
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          CachedNetworkImageProviderUtils(
                            imageUrl: controller.profilePic ?? "",
                            height: 32,
                            width: 32,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: assignedToDropDown(),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Participants ",
                            style: Styles.tsPrimaryColorSemiBold16,
                          ),
                          InkWell(
                            onTap: () => controller.launchParticipants(),
                            child: Row(
                              children: [
                                Icon(
                                  CupertinoIcons.add_circled_solid,
                                  color: AppColors.primaryBlue,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "Add New",
                                  style: Styles.tsprimaryBlueSemiBold14,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 32,
                        child: Obx(
                          () => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount:
                                controller.updatedParticipantsList.length,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  CachedNetworkImageProviderUtils(
                                    imageUrl: controller
                                            .updatedParticipantsList[index]
                                            .profilePicture ??
                                        "",
                                    height: 32,
                                    width: 32,
                                  ),
                                  SizedBox(width: 8)
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Updates",
                        style: Styles.tsPrimaryColorSemiBold16,
                      ),
                      SizedBox(height: 15),

                      Obx(
                        () => Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: controller.updatedList.length > 2
                                  ? 2
                                  : controller.updatedList.length,
                              itemBuilder: (context, index) {
                                var data = controller.updatedList[index];
                                DateTime time = DateTime.parse(
                                    data.updatedBy?.updatedAt ?? "");

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
                            controller.updatedList.length > 2
                                ? Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                      onPressed: () {
                                        Get.toNamed(
                                          Routes.SHOWUPDATE,
                                          arguments: controller.updatedList,
                                        );
                                      },
                                      child: Text(
                                        "Show more",
                                        style: Styles.tsprimaryBlueSemiBold12,
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Comments", style: Styles.tsPrimaryBlueSemiBold18),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.SHOWCOMMENTS);
                    },
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.add_circled_solid,
                          color: AppColors.primaryBlue,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Add New",
                          style: Styles.tsprimaryBlueSemiBold14,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Obx(
                () => Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.commentList.length > 2
                          ? 2
                          : controller.commentList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var data = controller.commentList[index];
                        DateTime time = DateTime.parse(data.createdAt ?? "");

                        return CommentUtils(
                          imageUrl: data.user?.profilePicture ?? "",
                          name: data.user?.name ?? "",
                          time: timeago.format(time),
                          comments: data.description ?? "",
                        );
                      },
                    ),
                    controller.commentList.length > 2
                        ? Align(
                            alignment: Alignment.bottomRight,
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(
                                  Routes.SHOWCOMMENTS,
                                  arguments: controller.commentList,
                                );
                              },
                              child: Text(
                                "Show more",
                                style: Styles.tsprimaryBlueSemiBold12,
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
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
                      padding: EdgeInsets.all(10),
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
                child: InkWell(
                  onTap: () => controller.postAllComments(),
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
              ),
              SizedBox(
                height: 50,
              ),
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
          child: Obx(
            () => DropdownButton(
              isExpanded: true,
              value: controller.selectedDevops.value,
              items: controller.devopsLists.map((element) {
                return DropdownMenuItem(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        element.name ?? "",
                        style: Styles.tsPrimaryIndigoSemiBold14,
                      )),
                  value: element.name ?? "",
                );
              }).toList(),
              icon: Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.primaryIndigo,
                ),
              ),
              onChanged: (String? value) {
                controller.selectedDevops.value = value ?? "";
                controller.assignedToPerformAction(value!);
              },
            ),
          ),
        ),
      ),
    );
  }

  Container deploymentProjectCard() {
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
                  controller.uuid ?? "SQB-14",
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
            Text(
              controller.heading ?? "Testing Project",
              style: Styles.tsPrimaryColorSemiBold16,
            ),
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
                  controller.type ?? "Deployment Ticket",
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
                  controller.projectName ?? "Test 1",
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
                  controller.projectManager ?? "Nimish Dawar",
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
                  controller.repoName ?? "Test Repo",
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
                  controller.releasePriority ?? "PO - Service Downtime",
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
                  controller.environment ?? "Testing for developers and QA",
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
                  controller.releaseNotes ?? "Patch 1.0",
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
                  controller.deploymentSteps ?? "1,2,3",
                  style: Styles.tsPrimaryColorRegular12,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Watcher email",
                  style: Styles.tsprimaryIndigoSemiBold12,
                ),
                Text(
                  controller.email ?? "Testing ticket Feature",
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

  Container generalProjectCard() {
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
                  controller.uuid ?? "SQB-14",
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
                      child: Text(
                        "Delete",
                        style: Styles.tsRedSemiBold14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              controller.heading?.toUpperCase() ?? "Testing Project",
              style: Styles.tsPrimaryColorSemiBold16,
            ),
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
                  controller.type ?? "Deployment Ticket",
                  style: Styles.tsPrimaryColorRegular12,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Description",
                  style: Styles.tsprimaryIndigoSemiBold12,
                ),
                Text(
                  controller.description ?? "Testing ticket Feature",
                  style: Styles.tsPrimaryColorRegular12,
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Watcher email",
                  style: Styles.tsprimaryIndigoSemiBold12,
                ),
                Text(
                  controller.email ?? "Testing ticket Feature",
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
