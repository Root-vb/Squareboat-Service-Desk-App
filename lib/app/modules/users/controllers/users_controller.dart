import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/participants_list.dart';
import 'package:starter/app/data/models/dto/ticket_update.dart';

class UsersController extends GetxController {
  final usersList = <UpdateTicketParticipants>[].obs;

  final isSelected = false.obs;
  final RxList<String> users = RxList<String>();

  String? uid;

  addUser(int index, bool? value) {
    if (value == true) {
      users.add(usersList[index].id ?? "");
    } else {
      users.remove(usersList[index].id ?? "");
    }
  }

  onBackPressed() {
    Get.back(result: users.value);
  }

  final count = 0.obs;
  @override
  void onInit() {
    dynamic data = Get.arguments;

    usersList.value = data['list'];
    uid = data['uid'];
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
