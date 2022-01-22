import 'package:flutter/material.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';
import 'package:timeago/timeago.dart' as timeago;

class UpdatesSection extends StatelessWidget {
  const UpdatesSection({
    Key? key,
    required this.name,
    required this.time,
    required this.fieldName,
    required this.newValue,
  }) : super(key: key);

  final String name;
  final String fieldName;
  final DateTime time;
  final String newValue;

  @override
  Widget build(BuildContext context) {
    String value = "";

    if (fieldName == "Participants") {
      value = "Participants updated";
    } else if (fieldName == "assignedTo") {
      value = "Ticket Assigned to $newValue";
    } else {
      value = "Status Updated to $newValue";
    }

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
                Text(value, style: Styles.tsPrimaryColorSemiBold14),
                Row(
                  children: [
                    Text(
                      "By $name ",
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
                            ' ${timeago.format(time)}',
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
}
