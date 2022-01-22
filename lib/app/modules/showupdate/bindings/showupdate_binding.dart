import 'package:get/get.dart';

import '../controllers/showupdate_controller.dart';

class ShowupdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowupdateController>(
      () => ShowupdateController(),
    );
  }
}
