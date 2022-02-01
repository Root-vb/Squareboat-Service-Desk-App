import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/utils/loading/loading_utils.dart';

import 'package:starter/widgets/buttons/custom_button.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: AppColors.primaryColor,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryBlue,
          onPressed: () {
            controller.updateFilter();
            Get.bottomSheet(
              Container(
                color: Colors.white,
                height: Get.height * 0.85,
                child: SafeArea(
                  child: Column(
                    children: [
                      Container(
                        child: Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                  ),
                                  child: Text(
                                    "Filter",
                                    style: Styles.tsPrimaryColorBold21,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Text(
                                    "Status",
                                    style: Styles.tsPrimaryColorSemiBold16,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Divider(
                                      color: Color(0xffEEF2F8), thickness: 2),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: controller.statusList.length,
                                    itemBuilder: (context, index) {
                                      return Obx(
                                        () => CheckboxListTile(
                                          title: Text(
                                            controller.statusList[index],
                                            style:
                                                Styles.tsPrimaryColorRegular12,
                                          ),
                                          value: controller.tempStoreStatusList
                                              .contains(
                                                  controller.statusList[index]),
                                          dense: true,
                                          onChanged: (value) {
                                            controller.addStatus(index, value);
                                          },
                                          checkColor: AppColors.white,
                                          activeColor: AppColors.primaryBlue,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Divider(
                                      color: Color(0xffEEF2F8), thickness: 2),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 24),
                                  child: Text(
                                    "Assigned To",
                                    style: Styles.tsPrimaryColorBold19,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 14),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: controller.devopsLists.length,
                                    itemBuilder: (context, index) {
                                      return Obx(
                                        () => CheckboxListTile(
                                          title: Text(
                                            controller
                                                    .devopsLists[index].name ??
                                                "",
                                            style:
                                                Styles.tsPrimaryColorRegular12,
                                          ),
                                          value: controller
                                              .tempAssignedDevopsList
                                              .contains(controller
                                                  .devopsLists[index].id),
                                          dense: true,
                                          onChanged: (value) {
                                            controller.addAssignedDevops(
                                                index, value);
                                          },
                                          checkColor: AppColors.white,
                                          activeColor: AppColors.primaryBlue,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () => controller.cancelButton(),
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width / 2,
                                color: AppColors.grey,
                                child: Center(
                                    child: Text(
                                  "CANCEL",
                                  style: Styles.tsPrimaryColorSemiBold14,
                                )),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                controller.applyFilter();
                              },
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width / 2,
                                color: AppColors.primaryBlue,
                                child: Center(
                                  child: Text(
                                    " APPLY",
                                    style: Styles.tsWhiteSemiBold14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              isScrollControlled: true,
            );
          },
          child: const Icon(Icons.filter_list_alt, color: Colors.white),
        ),
        body: RefreshIndicator(
          onRefresh: () => controller.onRefresh(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Tickets",
                      style: Styles.tsPrimaryColorSemiBold28,
                    ),
                    CustomButton(onPressed: () {
                      Get.toNamed(Routes.CREATE_TICKET);
                    })
                  ],
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: Obx(
                  () => controller.pageState() == LoadingStates.LOADING
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : controller.pageState() != LoadingStates.EMPTY
                          ? ListView.builder(
                              controller: controller.scrollController,
                              shrinkWrap: true,
                              itemCount: controller.ticketList.length,
                              physics: AlwaysScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ticketItem(index);
                              },
                            )
                          : Center(
                              child: Text(
                                "No TIcket Found!",
                                style: Styles.tsDarkGreySemiBold13,
                              ),
                            ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ticketItem(int index) {
    DateTime time =
        DateTime.parse(controller.ticketList[index].createdAt ?? "");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.TICKET, arguments: {
            'profilePic': controller.ticketList[index].profilePicture,
            'name': controller.ticketList[index].createdBy,
            'uuid': controller.ticketList[index].uuid,
            'heading': controller.ticketList[index].formFields!.heading,
            'type': controller.ticketList[index].type,
            'description': controller.ticketList[index].formFields?.description,
            'projectName': controller.ticketList[index].formFields?.projectName,
            'projectManager':
                controller.ticketList[index].formFields?.managerName,
            'repoName': controller.ticketList[index].formFields?.repoName,
            'releasePriority':
                controller.ticketList[index].formFields?.releasePriority,
            'environment': controller.ticketList[index].formFields?.environment,
            'releaseNotes':
                controller.ticketList[index].formFields?.releaseNotes,
            'deploymentSteps':
                controller.ticketList[index].formFields?.deploymentSteps,
            'email': controller.ticketList[index].formFields?.watcher,
            'ticketStatus': controller.ticketList[index].status,
            'participants': controller.ticketList[index].participants,
            'assignedTo': controller.ticketList[index].assignedTo?.id,
          });
        },
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7.0),
                border: Border.all(
                  color: AppColors.lightGrey,
                  width: 0.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: AppColors.lightBlueOpactiy40,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: Text(
                              controller.ticketList[index].type ??
                                  'General Ticket',
                              style: Styles.tsPrimaryColorBold19,
                            ),
                          ),
                          Container(
                            height: 29,
                            decoration: BoxDecoration(
                                color: AppColors.lightBlueOpacity100,
                                borderRadius: BorderRadius.circular(6.0)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Center(
                                child: Text(
                                  controller.ticketList[index].status ?? "-",
                                  style: Styles.tsWhiteBold12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "Heading",
                          style: Styles.tsDarkGreySemiBold13,
                        ),
                        SizedBox(height: 8),
                        Text(
                          controller.ticketList[index].formFields!.heading
                                  ?.toUpperCase() ??
                              "",
                          style: Styles.tslightBlueWithOpcaity100Bold17,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Assigned To",
                          style: Styles.tsDarkGreySemiBold13,
                        ),
                        SizedBox(height: 8),
                        Text(
                          controller.ticketList[index].assignedTo?.name ?? "-",
                          style: Styles.tsPrimaryColorSemiBold17,
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Created By",
                          style: Styles.tsDarkGreySemiBold13,
                        ),
                        SizedBox(height: 8),
                        Text(
                          controller.ticketList[index].createdBy ??
                              "Created By",
                          style: Styles.tsPrimaryColorSemiBold17,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.lightBlueOpactiy40,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              controller.ticketList[index].uuid ?? "SQB",
                              style: Styles.tslightBlueWithOpcaity100SemiBold18,
                            ),
                          ),
                          Text(
                            timeago.format(time),
                            style: Styles.tsDarkGreySemiBold12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
