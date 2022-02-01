import 'package:get/get.dart';

class ShowcommentsController extends GetxController {
  RxList allComments = RxList();
  String? uuidOfCurrentUser;

  @override
  void onInit() {
    dynamic data = Get.arguments;

    if (data != null) {
      allComments.addAll(data['commentList']);
    }

    uuidOfCurrentUser = data["uuidOfCurrentUser"];
    // RxList<Data>? data = Get.arguments;

    // if (data != null) {
    //   allComments.addAll(data);
    // }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
