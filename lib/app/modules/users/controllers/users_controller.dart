import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/participants_list.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/repository/participants_repository.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class UsersController extends GetxController {
  final isSelected = false.obs;
  final RxList<String> users = RxList<String>();
  var participantsList = <Participants>[].obs;
  TextEditingController searchController = TextEditingController();

  String? uid;

  ParticipantsRepository participantsRepository = ParticipantsRepository();

  var selectedUser = [];

  addUser(int index, bool? value) {
    if (value == true) {
      users.add(participantsList[index].id ?? "");
      selectedUser.add(participantsList[index].name);
    } else {
      users.remove(participantsList[index].id ?? "");
      selectedUser.remove(participantsList[index].name);
    }
  }

  Future<void> getAllParticipants() async {
    RepoResponse<ParticipantsList> repoResponse =
        await participantsRepository.fetchAllPartcipants({
      "Authorization": 'Bearer ${Storage.getUser().access_token}',
    });

    if (repoResponse.error == null) {
      repoResponse.data?.data?.forEach((element) {
        participantsList.add(element);
        print(element.name);
      });
    }
  }

  onBackPressed() {
    Get.back(result: users.value);
  }

  final count = 0.obs;
  @override
  void onInit() {
    List<String>? data = Get.arguments;

    if (data != null) {
      users.addAll(data);
    }

    getAllParticipants();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
