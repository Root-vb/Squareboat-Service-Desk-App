import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/comment.dart';

class ShowcommentsController extends GetxController {
  RxList allComments = RxList();

  @override
  void onInit() {
    RxList<Data>? data = Get.arguments;

    if (data != null) {
      allComments.addAll(data);
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
