import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/widgets/buttons/custom_button.dart';

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
      body: Column(
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
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
                            "General Ticket",
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
                    "",
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
                    "Vinayak Sarawagi",
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
                    "Vaibhav Bhasin",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                Container(
                  color: Color(0xffEFF2F4),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            "SQB-7",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                        Text(
                          "3 hour ago",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text(
                //     controller.ticketList[index].heading.isEmpty
                //         ? "Issue Releated to SquareBoat Help Desk"
                //         : controller.ticketList[index].heading,
                //     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       RichText(
                //           text: TextSpan(children: [
                //         TextSpan(
                //           text: "Ticket id: ",
                //           style: TextStyle(
                //             color: Colors.grey,
                //           ),
                //         ),
                //         TextSpan(
                //           text: "#09465",
                //           style: TextStyle(
                //             color: Colors.black,
                //           ),
                //         )
                //       ])),
                //       Row(
                //         children: [
                //           Icon(
                //             Icons.circle,
                //             color: Colors.amber,
                //             size: 14,
                //           ),
                //           Text(
                //             controller.ticketList[index].type.isEmpty
                //                 ? "type"
                //                 : controller.ticketList[index].type,
                //           ),
                //         ],
                //       ),
                //       Row(
                //         children: [
                //           Icon(
                //             Icons.circle,
                //             color: Colors.red,
                //             size: 14,
                //           ),
                //           Text(" status"),
                //         ],
                //       ),
                //       Text("06/01/2022"),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
