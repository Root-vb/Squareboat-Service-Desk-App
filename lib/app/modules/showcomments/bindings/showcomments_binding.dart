import 'package:get/get.dart';

import '../controllers/showcomments_controller.dart';

class ShowcommentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowcommentsController>(
      () => ShowcommentsController(),
    );
  }
}
