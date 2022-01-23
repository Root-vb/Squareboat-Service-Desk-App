import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/widgets/comment_box_util.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../controllers/showcomments_controller.dart';

class ShowcommentsView extends GetView<ShowcommentsController> {
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
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.allComments.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var data = controller.allComments[index];
              DateTime time = DateTime.parse(data.createdAt ?? "");

              return CommentUtils(
                imageUrl: data.user?.profilePicture ?? "",
                name: data.user?.name ?? "",
                time: timeago.format(time),
                comments: data.description ?? "",
              );
            },
          ),
        ),
      ),
    );
  }
}
