import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/ticket_update.dart';

class ShowupdateController extends GetxController {
  RxList allUpdatesList = RxList();

  @override
  void onInit() {
    RxList<Updates>? data = Get.arguments;

    if (data != null) {
      allUpdatesList.addAll(data);
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
