import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/comment.dart';
import 'package:starter/app/data/models/dto/devops.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/dto/ticket_update.dart';
import 'package:starter/app/data/repository/comment_repository.dart';
import 'package:starter/app/data/repository/devops_repository.dart';
import 'package:starter/app/data/repository/perform_action_repository.dart';
import 'package:starter/app/data/repository/ticket_update_repository.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class TicketController extends GetxController {
  var updatedValue = "New".obs;
  var selectedDevops = "Vinayak Sarawagi".obs;

  TextEditingController commentController = TextEditingController();
  TicketUpdateRepository ticketUpdateRepository = TicketUpdateRepository();
  CommentRepository commentRepository = CommentRepository();
  PerformActionRepository performActionRepository = PerformActionRepository();
  DevopsRepository devopsRepository = DevopsRepository();

  var devopsLists = <Devops>[].obs;
  var commentList = <Data>[].obs;
  var updatedList = <Updates>[].obs;
  var updatedParticipantsList = <UpdateTicketParticipants>[].obs;
  var result;

  String? profilePic;
  String? name;
  String? uuid;
  String? heading;
  String? type;
  String? description;
  String? projectName;
  String? projectManager;
  String? repoName;
  String? releasePriority;
  String? environment;
  String? releaseNotes;
  String? deploymentSteps;
  String? email;

  final items = [
    "New",
    "Assigned",
    "Ongoing",
    "Completed",
    "Invalid",
  ];

  fetchAllComments() async {
    commentList.clear();
    RepoResponse<Comment> repoResponse =
        await commentRepository.getAllComments(uuid!, {
      "Authorization": 'Bearer ${Storage.getUser().access_token}',
    });

    if (repoResponse.error == null) {
      repoResponse.data?.data?.forEach((element) {
        commentList.add(element);
      });
    }
  }

  Future<void> postAllComments() async {
    final response = await commentRepository.postComments(uuid!, {
      "description": commentController.text,
    }, {
      "Authorization": 'Bearer ${Storage.getUser().access_token}',
    });

    if (response.error == null) {
      print("Ticket create successfully!");

      fetchAllComments();
    }

    commentController.clear();
  }

  Future<void> getAllTicketUpdate() async {
    updatedList.clear();

    updatedParticipantsList.clear();

    RepoResponse<TicketUpdate> repoResponse =
        await ticketUpdateRepository.fetchAllTicketUpdate(uuid!, {
      "Authorization": 'Bearer ${Storage.getUser().access_token}',
    });

    if (repoResponse.error == null) {
      repoResponse.data?.updates?.forEach((element) {
        updatedList.add(element);
      });

      repoResponse.data?.participants?.forEach((element) {
        updatedParticipantsList.add(element);
      });
    }
  }

  Future<void> assignedToPerformAction(String name) async {
    String? id;

    for (var i = 0; i < devopsLists.length; i++) {
      if (name == devopsLists[i].name) {
        id = devopsLists[i].id;
        print(i);
      }
    }

    final repoResponse = await performActionRepository.fetchAllActions(
      uuid!,
      {
        "actionType": "update-assignedTo",
        "assignedTo": id,
      },
      {
        "Authorization": 'Bearer ${Storage.getUser().access_token}',
      },
    );

    if (repoResponse.error == null) {
      getAllTicketUpdate();

      // print(selectedDevops);
    }
  }

  Future<void> fetchAllDevops() async {
    RepoResponse<DevopsList> repoResponse =
        await devopsRepository.getAllDevopsDetails(
      {
        "Authorization": 'Bearer ${Storage.getUser().access_token}',
      },
    );

    if (repoResponse.error == null) {
      repoResponse.data?.devops?.forEach((element) {
        devopsLists.add(element);
      });
    }
  }

  launchParticipants() async {
    List<String> allParticipantsUuid = [];

    updatedParticipantsList.forEach((element) {
      allParticipantsUuid.add(element.id ?? "");
    });
    result = await Get.toNamed(Routes.USERS, arguments: allParticipantsUuid);

    if (result != null) {
      addPartcipantsPerformAction(result);
    }
  }

  Future<void> addPartcipantsPerformAction(List<String>? user) async {
    List<String> listOfParticipants = [];

    listOfParticipants.add(Storage.getUser().id);
    listOfParticipants.addAll(user ?? []);

    updatedParticipantsList.forEach((element) {
      listOfParticipants.add(element.id ?? "");
    });

    user?.forEach((element) {
      print("list $user");
    });

    final repoResponse = await performActionRepository.fetchAllActions(
      uuid!,
      {
        "actionType": "update-user",
        "users": [
          ...{...listOfParticipants}
        ]
      },
      {"Authorization": 'Bearer ${Storage.getUser().access_token}'},
    );

    if (repoResponse.error == null) {
      getAllTicketUpdate();
    }
  }

  @override
  void onInit() {
    dynamic data = Get.arguments;

    profilePic = data['profilePic'];
    name = data['name'];
    uuid = data['uuid'];
    heading = data['heading'];
    type = data['type'];
    description = data['description'];
    projectName = data['projectName'];
    projectManager = data['projectManager'];
    repoName = data['repoName'];
    releasePriority = data['releasePriority'];
    environment = data['environment'];
    releaseNotes = data['releaseNotes'];
    deploymentSteps = data['deploymentSteps'];
    email = data['email'];

    fetchAllComments();

    postAllComments();

    // getAllParticipants();

    getAllTicketUpdate();

    fetchAllDevops();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
