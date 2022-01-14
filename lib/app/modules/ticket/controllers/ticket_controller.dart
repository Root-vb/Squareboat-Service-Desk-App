import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketController extends GetxController {
  var updatedValue = "In Progress".obs;
  var selectedParticipants = "Nobody Assigned yet".obs;

  TextEditingController commentController = TextEditingController();

  String? profilePic;
  String? name;

  final items = [
    "In Progress",
    "Completed",
  ];

  final participantsList = [
    "Aakash Pandey",
    "Abhinav Anshul",
    "Abhipsa Matura",
    "Abul Karim",
    "Ankit Jain",
    "Ankit Kaushik",
    "Nobody Assigned yet"
  ];

  final count = 0.obs;
  @override
  void onInit() {
    dynamic data = Get.arguments;

    profilePic = data['profilePic'];
    name = data['name'];

    print(profilePic);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
