import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';

class DialogWidget extends StatelessWidget {
  final String title;
  final String text;
  final IconData icon;
  final VoidCallback action1;
  final VoidCallback action2;
  final bool isSecondryButtonVisible;

  final String actionText1;
  final String actionText2;

  final bool isTextCentreAligned;
  const DialogWidget({
    required this.title,
    required this.text,
    required this.icon,
    required this.action1,
    required this.action2,
    required this.actionText1,
    required this.actionText2,
    this.isSecondryButtonVisible = false,
    this.isTextCentreAligned = false,
  });
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon),
            const SizedBox(height: 8),
            Text(title,
                style: Styles.tsPrimaryColorSemiBold16,
                textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text(text,
                style: Styles.tsPrimaryColorRegular12,
                textAlign:
                    isTextCentreAligned ? TextAlign.center : TextAlign.start),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (isSecondryButtonVisible)
                  TextButton(onPressed: action1, child: Text(actionText1)),
                TextButton(onPressed: action2, child: Text(actionText2)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
