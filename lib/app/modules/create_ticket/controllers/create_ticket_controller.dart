import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/participants_list.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/repository/create_ticket_repository.dart';
import 'package:starter/app/data/repository/participants_repository.dart';
import 'package:starter/app/modules/home/controllers/home_controller.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/utils/helper/text_field_wrapper.dart';
import 'package:starter/utils/loading/loading_utils.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class CreateTicketController extends GetxController {
  final formKey = GlobalKey<FormState>();

  CreateTicketRepository _createTicketRepository = CreateTicketRepository();
  ParticipantsRepository participantsRepository = ParticipantsRepository();

  // General Wrapper

  TextFieldWrapper generalHeadingWrapper = TextFieldWrapper();
  TextFieldWrapper descriptionWrapper = TextFieldWrapper();
  TextFieldWrapper generalWatcherEmails = TextFieldWrapper();

  // Deployment wrapper
  TextFieldWrapper deploymentHeadingWrapper = TextFieldWrapper();
  TextFieldWrapper projectNameWrapper = TextFieldWrapper();
  TextFieldWrapper projectManagerWrapper = TextFieldWrapper();
  TextFieldWrapper repoNameWrapper = TextFieldWrapper();
  TextFieldWrapper branchNameWrapper = TextFieldWrapper();
  TextFieldWrapper releaseNotesWrapper = TextFieldWrapper();
  TextFieldWrapper deploymentStepsWrapper = TextFieldWrapper();
  TextFieldWrapper deploymentWatcherEmails = TextFieldWrapper();

  HomeController controller = Get.find<HomeController>();
  var participantsList = <Participants>[].obs;

  var selectedVal = <dynamic>[].obs;

  var updatedValue = "General Ticket".obs;
  var releasePriorityValue = "P0 - Service DownTime".obs;
  var enviromentsValue = "Testing - For Developers and QA".obs;
  var isGeneralTicket = true.obs;
  var selectedParticipants = "Select Participants".obs;
  String errorText = "Please fill in this feild";
  DateTime? currentBackPressTime;

  bool validator() {
    bool hasError = false;
    if (isGeneralTicket.isTrue) {
      if (generalHeadingWrapper.controller.text.isEmpty) {
        generalHeadingWrapper.errorText = errorText;
        hasError = true;
      } else {
        generalHeadingWrapper.errorText = '';
      }
      if (descriptionWrapper.controller.text.isEmpty) {
        descriptionWrapper.errorText = errorText;
        hasError = true;
      } else {
        descriptionWrapper.errorText = '';
      }
    } else {
      if (deploymentHeadingWrapper.controller.text.isEmpty) {
        deploymentHeadingWrapper.errorText = errorText;
        hasError = true;
      } else {
        deploymentHeadingWrapper.errorText = '';
      }

      if (projectManagerWrapper.controller.text.isEmpty) {
        projectManagerWrapper.errorText = errorText;
        hasError = true;
      } else {
        projectManagerWrapper.errorText = '';
      }

      if (projectNameWrapper.controller.text.isEmpty) {
        projectNameWrapper.errorText = errorText;
        hasError = true;
      } else {
        projectNameWrapper.errorText = '';
      }

      if (repoNameWrapper.controller.text.isEmpty) {
        repoNameWrapper.errorText = errorText;
        hasError = true;
      } else {
        repoNameWrapper.errorText = '';
      }

      if (branchNameWrapper.controller.text.isEmpty) {
        branchNameWrapper.errorText = errorText;
        hasError = true;
      } else {
        branchNameWrapper.errorText = '';
      }

      if (releaseNotesWrapper.controller.text.isEmpty) {
        releaseNotesWrapper.errorText = errorText;
        hasError = true;
      } else {
        releaseNotesWrapper.errorText = '';
      }

      if (deploymentStepsWrapper.controller.text.isEmpty) {
        deploymentStepsWrapper.errorText = errorText;
        hasError = true;
      } else {
        deploymentStepsWrapper.errorText = '';
      }
    }
    return hasError;
  }

  createTicket() async {
    final hasError = validator();

    if (hasError) {
      return;
    }

    if (isGeneralTicket.isTrue) {
      LoadingUtils.showLoader();

      final _response = await _createTicketRepository.createGeneralTicket(
        {
          "type": updatedValue.value,
          "heading": generalHeadingWrapper.controller.text,
          "description": descriptionWrapper.controller.text,
          "watcher": generalWatcherEmails.controller.text,
        },
        {"Authorization": 'Bearer ${Storage.getUser().access_token}'},
      );

      LoadingUtils.hideLoader();

      if (_response.error == null) {
        Get.offAllNamed(Routes.DASHBOARD);
        controller.onRefresh();
        Get.snackbar(
          "Sucess!",
          "General Ticket Created!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.darkWhite,
        );

        generalHeadingWrapper.controller.clear();
        descriptionWrapper.controller.clear();
        generalWatcherEmails.controller.clear();
      }
    } else {
      LoadingUtils.showLoader();

      List<String> uuidOfUser = [];

      for (var i = 0; i < participantsList.value.length; i++) {
        for (var j = 0; j < selectedVal.length; j++) {
          if (selectedVal[j] == participantsList[i].name) {
            print(participantsList[i].id);
            uuidOfUser.add(participantsList[i].id ?? "");
          }
        }
      }

      final _response = await _createTicketRepository.createDeploymentTicket(
        {
          // "referenceId": 34,
          "type": updatedValue.value,
          "status": "created",
          "heading": deploymentHeadingWrapper.controller.text,
          "projectName": projectNameWrapper.controller.text,
          "managerName": projectManagerWrapper.controller.text,
          "repoName": repoNameWrapper.controller.text,
          "branchName": branchNameWrapper.controller.text,
          "releasePriority": releasePriorityValue.value,
          "releaseNotes": releaseNotesWrapper.controller.text,
          "environment": enviromentsValue.value,
          "participants": uuidOfUser,
          "deploymentSteps": deploymentStepsWrapper.controller.text,
          "watcher": deploymentWatcherEmails.controller.text,
        },
        {"Authorization": 'Bearer ${Storage.getUser().access_token}'},
      );

      LoadingUtils.hideLoader();

      if (_response.error == null) {
        Get.offAllNamed(Routes.DASHBOARD);

        controller.onRefresh();

        Get.snackbar(
          "Sucess!",
          "Deployment Ticket Created!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.darkWhite,
        );

        deploymentHeadingWrapper.controller.clear();
        projectManagerWrapper.controller.clear();
        projectNameWrapper.controller.clear();
        repoNameWrapper.controller.clear();
        branchNameWrapper.controller.clear();
        releaseNotesWrapper.controller.clear();
        deploymentStepsWrapper.controller.clear();
        deploymentWatcherEmails.controller.clear();
      }
    }
  }

  removeValue(String value) {
    selectedVal.remove(value);
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

    selectedParticipants.value = participantsList.first.name ?? "Ashwani Singh";
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      LoadingUtils().doubleTapWarning();
      return Future.value(false);
    }
    return Future.value(true);
  }

  final items = [
    "General Ticket",
    "Deployment Ticket",
  ];

  final releasePriority = [
    "P0 - Service DownTime",
    "P1 - Production Bug",
    "P2 - Weekly Release / Bug Fix",
    "P2 - First Time Setup"
  ];

  final enviromentsList = [
    "Testing - For Developers and QA",
    "Staging - For Clients and QA",
    "Production",
  ];

  @override
  void onInit() {
    print(Storage.getUser().access_token);

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
