import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/participants_list.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/repository/participants_repository.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class ParticipantsController extends GetxController {
  final isSelected = false.obs;
  String? uuidOfTicketCreator;
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
      if (uuidOfTicketCreator == participantsList[index].id) {
        Get.snackbar(
          "Error",
          "Creater of the ticket can't be removed.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.black,
          colorText: Colors.white,
        );
      } else {
        selectedUser.remove(participantsList[index].name);
        users.remove(participantsList[index].id ?? "");
      }
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
      });
    }
  }

  var searchList = <Participants>[].obs;
  final RxBool showSearchResult = false.obs;

  onSearchTextChanged(String text, BuildContext context) async {
    searchList.clear();
    if (text.isEmpty) {
      showSearchResult.value = false;
      return;
    } else {
      searchList.value = participantsList
          .where((value) =>
              value.name?.toLowerCase().startsWith(text.toLowerCase()) ?? true)
          .toList();

      showSearchResult.value = true;

      searchList.forEach((element) {
        print(element.name);
      });
    }
  }

  onBackPressed() {
    Get.back(result: users.value);
  }

  @override
  void onInit() {
    dynamic data = Get.arguments;

    if (data != null) {
      users.addAll(data['listOfPartcipants']);
    }

    uuidOfTicketCreator = data['uuidOfTicketCreator'];

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
