import 'package:get/get.dart';
import 'package:starter/app/modules/dashboard/dashboard_controller.dart';
import 'package:starter/app/modules/home/controllers/home_controller.dart';
import 'package:starter/app/modules/profile/profile_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DashboardController(),
    );
    Get.lazyPut(
      () => HomeController(),
    );

    Get.lazyPut(
      () => ProfileController(),
    );
  }
}
