import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/repository/create_ticket_repository.dart';
import 'package:starter/app/modules/home/controllers/home_controller.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/utils/helper/text_field_wrapper.dart';
import 'package:starter/utils/loading/loading_utils.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class CreateTicketController extends GetxController {
  final formKey = GlobalKey<FormState>();

  CreateTicketRepository _createTicketRepository = CreateTicketRepository();
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

  createTicket() async {
    if (isGeneralTicket.isTrue) {
      LoadingUtils.showLoader();

      final _response = await _createTicketRepository.createGeneralTicket(
        {
          "type": updatedValue.value,
          "heading": generalHeadingWrapper.controller.text,
          "description": descriptionWrapper.controller.text,
          "watcherEmail": generalWatcherEmails.controller.text,
        },
        {"Authorization": 'Bearer ${Storage.getUser().access_token}'},
      );

      LoadingUtils.hideLoader();

      if (_response.error == null) {
        Get.back();
        controller.allTicket();
        Get.snackbar(
          "Sucess",
          "General Ticket Created!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.green,
        );

        generalHeadingWrapper.controller.clear();
        descriptionWrapper.controller.clear();
        generalWatcherEmails.controller.clear();
      }
    } else {
      LoadingUtils.showLoader();
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
          // "participants": selectedParticipants.value,
          "deploymentSteps": deploymentStepsWrapper.controller.text,
          "watcherEmail": deploymentWatcherEmails.controller.text,
        },
        {"Authorization": 'Bearer ${Storage.getUser().access_token}'},
      );

      LoadingUtils.hideLoader();

      if (_response.error == null) {
        Get.back();

        controller.allTicket();

        Get.snackbar(
          "Sucess",
          "Deployment Ticket Created!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.green,
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

  final participantsList = [
    "Aakash Pandey",
    "Abhinav Anshul",
    "Abhipsa Matura",
    "Abul Karim",
    "Ankit Jain",
    "Ankit Kaushik",
    "Select Participants"
  ];

  var selectedVal = [];

  var updatedValue = "General Ticket".obs;
  var releasePriorityValue = "P0 - Service DownTime".obs;
  var enviromentsValue = "Testing - For Developers and QA".obs;
  var isGeneralTicket = true.obs;
  var selectedParticipants = "Select Participants".obs;

  @override
  void onInit() {
    print(Storage.getUser().access_token);
    print(deploymentHeadingWrapper.controller.text);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
