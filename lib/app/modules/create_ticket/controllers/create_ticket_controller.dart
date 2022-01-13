import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/modules/home/views/home_view.dart';
import 'package:starter/utils/helper/text_field_wrapper.dart';

class CreateTicketController extends GetxController {
  //TODO: Implement CreateTicketController

  final formKey = GlobalKey<FormState>();

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

  createGeneralTicket() {
    Get.offAll(() => HomeView(), arguments: {
      "type": updatedValue,
      "heading": generalHeadingWrapper.controller.text,
      "description": descriptionWrapper.controller.text,
      "email": generalWatcherEmails.controller.text,
    });
    Get.snackbar(
      "Ticket Created!",
      "Go to home page to view your ticket",
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.green,
    );
  }

  createDeploymentTicket() {
    Get.offAll(() => HomeView(), arguments: {
      "type": "Deployment Ticket",
      "heading": deploymentHeadingWrapper.controller.text,
      "project": projectNameWrapper.controller.text,
      "email": generalWatcherEmails.controller.text,
    });
    Get.snackbar(
      "Ticket Created!",
      "Go to home page to view your ticket",
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.green,
    );
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
