import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/widgets/buttons/custom_button.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Home',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 10, 14, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tickets ",
                  style: TextStyle(
                    fontFamily: "poppins",
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                CustomButton(onPressed: () {
                  Get.toNamed(Routes.CREATE_TICKET);
                })
              ],
            ),
          ),
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
    );
  }

  Widget ticketItem(int index) {
    DateTime time =
        DateTime.parse(controller.ticketList[index].createdAt ?? "");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.TICKET, arguments: {
              'profilePic': controller.ticketList[index].profilePicture,
              'name': controller.ticketList[index].participants![index].name,
            });
          },
          child: Container(
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Color(0xffEFF2F4),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              controller.ticketList[index].type ??
                                  'General Ticket',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          ClipRRect(
                            child: Container(
                              child: MaterialButton(
                                onPressed: () {},
                                color: Color(0xff3FB883),
                                child: Text(
                                  "New",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                    child: Text(
                      "Heading",
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      controller.ticketList[index].formFields!.heading ?? "",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                    child: Text(
                      "Assigned To",
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      "assigned to",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                    child: Text(
                      "Created By",
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, bottom: 8),
                    child: Text(
                      controller.ticketList[index].createdBy ?? "Created By",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    color: Color(0xffEFF2F4),
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
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                          Text(
                            timeago.format(time),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
