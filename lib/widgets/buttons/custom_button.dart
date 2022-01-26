import 'package:flutter/material.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/app/theme/styles.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;

  CustomButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 40,
          width: 136,
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.add,
                size: 15.25,
                color: AppColors.white,
              ),
              Text(
                "Create New",
                style: Styles.tsWhiteSemiBold14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
