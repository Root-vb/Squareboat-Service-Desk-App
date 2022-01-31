import 'package:flutter/material.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:starter/widgets/cached_netwrok_image_utils.dart';

class CommentUtils extends StatelessWidget {
  const CommentUtils({
    Key? key,
    required this.time,
    required this.imageUrl,
    required this.name,
    required this.comments,
  }) : super(key: key);

  final String time;
  final String imageUrl;
  final String name;
  final String comments;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.darkWhite,
            borderRadius: BorderRadius.circular(7.0),
            border: Border.all(
              width: 1,
              color: Color.fromRGBO(216, 216, 216, 0.26),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    child: CachedNetworkImageProviderUtils(
                      imageUrl: imageUrl,
                      height: 30,
                      width: 30,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  name,
                                  style: Styles.tsPrimaryColorBold14,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  time,
                                  style: Styles.tsDarkGreySemiBold12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                            text: TextSpan(
                              text: comments,
                              style: Styles.tsPrimaryColorRegular14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
