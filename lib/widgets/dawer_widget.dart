import 'package:flutter/material.dart';
import 'package:starter/app/theme/app_colors.dart';

class DrawerWidget extends StatelessWidget {
  final Function() onTap;
  const DrawerWidget({
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(height: 50),
          Container(
            color: AppColors.darkWhite,
            child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Users"),
                onTap: onTap),
          )
        ],
      ),
    );
  }
}
