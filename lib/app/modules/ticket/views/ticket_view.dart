import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/devops.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/widgets/cached_netwrok_image_utils.dart';
import 'package:starter/widgets/comment_box_util.dart';
import 'package:starter/widgets/update_section.dart';
import 'package:starter/widgets/upper_case_formatter.dart';
import '../controllers/ticket_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class TicketView extends GetView<TicketController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
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
                                  DateTime time =
                                      DateTime.parse(data.updatedAt ?? "");

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
                                      alignment: Alignment.bottomLeft,
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
                Text("Comments", style: Styles.tsPrimaryBlueSemiBold18),
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
                    Expanded(
                      child: TextField(
                        controller: controller.commentController,
                        maxLines: 4,
                        inputFormatters: [UpperCaseTextFormatter()],
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        onSubmitted: (value) async {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          hintText: "  Post a comment...",
                          hintStyle: Styles.tsPrimaryColorSemiBold14.copyWith(
                            color: AppColors.primaryColor.withOpacity(0.37),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff595C97),
                              width: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff595C97),
                              width: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 0.1,
                              color: Color(0xff595C97),
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff595C97),
                              width: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: () => controller.postAllComments(context),
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
                SizedBox(height: 50),
              ],
            ),
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
              items: controller.devopsLists.map((Devops element) {
                return DropdownMenuItem<String>(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(element.name ?? "",
                          style: Styles.tsPrimaryIndigoSemiBold14)),
                  value: element.id ?? "",
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
                if (controller.currentUserIsDevops.value) {
                  controller.selectedDevops.value = value ?? "";
                  controller.assignedToPerformAction(value!);
                } else {
                  Get.snackbar(
                    "Error",
                    "Only Devops has the permissions!",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.darkWhite,
                    colorText: AppColors.primaryColor,
                  );
                }

                if (controller.uuidOfCurrentUser ==
                    controller.uuidOfAssignedUser) {
                  controller.changeStatus.value = true;
                } else {
                  controller.changeStatus.value = false;
                }
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
            Text(
              controller.uuid ?? "-",
              style: Styles.tsPrimaryBlueBold18,
            ),
            SizedBox(height: 8),
            Text(
              controller.heading ?? "-",
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
                SizedBox(width: 40),
                Flexible(
                  child: Text(
                    controller.projectName ?? "-",
                    style: Styles.tsPrimaryColorRegular12,
                  ),
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
                SizedBox(width: 40),
                Flexible(
                  child: Text(
                    controller.projectManager ?? "-",
                    style: Styles.tsPrimaryColorRegular12,
                  ),
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
                SizedBox(width: 40),
                Flexible(
                  child: Text(
                    controller.repoName ?? "-",
                    style: Styles.tsPrimaryColorRegular12,
                  ),
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
                  controller.releasePriority ?? "-",
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
                  controller.environment ?? "-",
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
                SizedBox(width: 40),
                Flexible(
                  child: Text(
                    controller.releaseNotes ?? "-",
                    style: Styles.tsPrimaryColorRegular12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "Deployment Steps",
                    style: Styles.tsprimaryIndigoSemiBold12,
                  ),
                ),
                SizedBox(width: 40),
                Flexible(
                  child: Text(
                    controller.deploymentSteps ?? "-",
                    style: Styles.tsPrimaryColorRegular12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "Watcher email",
                    style: Styles.tsprimaryIndigoSemiBold12,
                  ),
                ),
                // SizedBox(width: 50),
                Flexible(
                  child: Text(
                    controller.email ?? "-",
                    style: Styles.tsPrimaryColorRegular12,
                  ),
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
            Text(
              controller.uuid ?? "-",
              style: Styles.tsPrimaryBlueBold18,
            ),
            SizedBox(height: 8),
            Text(
              controller.heading?.toUpperCase() ?? "-",
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
                Flexible(
                  child: Text(
                    controller.type ?? "-",
                    style: Styles.tsPrimaryColorRegular12,
                  ),
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
                SizedBox(width: 50),
                Flexible(
                  child: Text(
                    controller.description ?? "-",
                    style: Styles.tsPrimaryColorRegular12,
                  ),
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
                Flexible(
                  child: Text(
                    controller.email ?? "-",
                    style: Styles.tsPrimaryColorRegular12,
                  ),
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
          child: Obx(
            () => DropdownButton(
              dropdownColor: AppColors.primaryBlue,
              focusColor: Colors.red,
              isExpanded: false,
              value: controller.ticketStatus.value,
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
              onChanged: (String? value) {
                if (controller.changeStatus.value == true) {
                  controller.changeTicketStatus(value ?? "");
                  controller.ticketStatus.value = value ?? "";
                } else {
                  Get.snackbar(
                    "Error!",
                    "Only Devops has the permissions!",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.darkWhite,
                  );
                }
              },
            ),
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
          style: Styles.tsPrimaryColorSemiBold17,
        ),
      ],
    );
  }
}
