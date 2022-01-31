import 'package:get/get.dart';

import '../controllers/partcipants_controller.dart';

class PartcipantsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParticipantsController>(
      () => ParticipantsController(),
    );
  }
}
