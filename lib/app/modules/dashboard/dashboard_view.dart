import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/values/images.dart';

import 'package:starter/app/modules/dashboard/dashboard_controller.dart';
import 'package:starter/app/modules/home/views/home_view.dart';
import 'package:starter/app/modules/profile/profile_view.dart';
import 'package:starter/app/routes/app_pages.dart';

class DashboardView extends GetView<DashboardController> {
  static launch() => Get.offAllNamed(Routes.DASHBOARD);

  @override
  Widget build(BuildContext context) {
    BottomNavigationBarItem navigationBarItem({
      required String activeIcon,
      required String inactiveIcon,
    }) {
      return BottomNavigationBarItem(
        activeIcon: Image.asset(
          activeIcon,
          height: 35,
          width: 35,
        ),
        icon: Image.asset(
          inactiveIcon,
          height: 30,
          width: 30,
        ),
        label: "",
      );
    }

    return Scaffold(
      body: Obx(
        () => getSelectedPage(controller.getIndex().value),
      ),
      bottomNavigationBar: Obx(
        () => ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            onTap: (newIndex) {
              controller.index(newIndex);
            },
            currentIndex: controller.getIndex().value,
            items: [
              navigationBarItem(
                activeIcon: Images.homeIcon,
                inactiveIcon: Images.homeIcon,
              ),
              navigationBarItem(
                activeIcon: Images.profile,
                inactiveIcon: Images.profile,
              ),
              // navigationBarItem(
              //   activeIcon: Images.icAppLogo,
              //   inactiveIcon: Images.icAppLogo,
              // ),
              // navigationBarItem(
              //   activeIcon: Images.icAppLogo,
              //   inactiveIcon: Images.icAppLogo,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  getSelectedPage(int index) {
    switch (index) {
      case 0:
        return HomeView();
      case 1:
        return ProfileView();

      default:
        return HomeView();
    }
  }
}
