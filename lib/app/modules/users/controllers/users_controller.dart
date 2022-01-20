import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/participants_list.dart';
import 'package:starter/app/data/repository/perform_action_repository.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class UsersController extends GetxController {
  var usersList = <Participants>[].obs;

  var isSelected = false.obs;

  RxList<int> isChecked = RxList<int>();
  String? uid;

  PerformActionRepository performActionRepository = PerformActionRepository();

  Future<void> addPartcipantsPerformAction() async {
    List<String> users = [];

    users.add(Storage.getUser().id);

    isChecked.forEach((element) {
      users.add(usersList[element].id!);
    });

    final repoResponse = await performActionRepository.fetchAllActions(
      uid!,
      {
        "actionType": "update-user",
        "users": users,
      },
      {
        "Authorization": 'Bearer ${Storage.getUser().access_token}',
      },
    );
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
