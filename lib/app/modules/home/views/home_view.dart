import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/widgets/buttons/custom_button.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.allTicket(),
        child: SingleChildScrollView(
          controller: controller.scrollController,
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
              SizedBox(height: 40),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.ticketList.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ticketItem(index);
                  },
                ),
              )
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
            'name': controller.ticketList[index].participants?[0].name,
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
            'email': controller.ticketList[index].participants?[0].email
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
              child: Card(
                elevation: 0,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                controller.ticketList[index].type ??
                                    'General Ticket',
                                style: Styles.tsPrimaryColorBold20,
                              ),
                            ),
                            Container(
                              height: 29,
                              width: 65,
                              decoration: BoxDecoration(
                                  color: AppColors.lightBlue,
                                  borderRadius: BorderRadius.circular(6.0)),
                              child: MaterialButton(
                                onPressed: () {},
                                child: Text(
                                  "NEW",
                                  style: Styles.tsWhiteBold12,
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
                            style: Styles.tsDarkGreySemiBold14,
                          ),
                          SizedBox(height: 8),
                          Text(
                            controller.ticketList[index].formFields!.heading
                                    ?.toUpperCase() ??
                                "",
                            style: Styles.tslightBlueWithOpcaity100Bold18,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Assigned To",
                            style: Styles.tsDarkGreySemiBold14,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "assigned to",
                            style: Styles.tsPrimaryColorSemiBold18,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Created By",
                            style: Styles.tsDarkGreySemiBold14,
                          ),
                          SizedBox(height: 8),
                          Text(
                            controller.ticketList[index].createdBy ??
                                "Created By",
                            style: Styles.tsPrimaryColorSemiBold18,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                controller.ticketList[index].uuid ?? "SQB",
                                style:
                                    Styles.tslightBlueWithOpcaity100SemiBold18,
                              ),
                            ),
                            Text(
                              timeago.format(time),
                              style: Styles.tsDarkGreyRegular12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
