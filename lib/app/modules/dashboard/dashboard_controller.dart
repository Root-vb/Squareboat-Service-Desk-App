import 'package:get/get.dart';
import 'package:starter/app/routes/app_pages.dart';

class DashboardController extends GetxController {
  var index = 0.obs;

  void onItemClick(MenuEnum val) {
    switch (val) {
      case MenuEnum.HOME:
        Get.toNamed(Routes.HOME);
        break;
      case MenuEnum.PROFILE:
        Get.toNamed(Routes.PROFILE);
        break;
    }
  }

  getIndex() {
    return index;
  }
}

enum MenuEnum {
  HOME,
  PROFILE,
}
