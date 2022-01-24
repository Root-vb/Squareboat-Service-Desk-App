import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/comment.dart';
import 'package:starter/app/data/models/dto/devops.dart';
import 'package:starter/app/data/models/dto/myprofile.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/dto/ticket_update.dart';
import 'package:starter/app/data/repository/comment_repository.dart';
import 'package:starter/app/data/repository/devops_repository.dart';
import 'package:starter/app/data/repository/perform_action_repository.dart';
import 'package:starter/app/data/repository/profile_repository.dart';
import 'package:starter/app/data/repository/ticket_update_repository.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class TicketController extends GetxController {
  var ticketStatus = "New".obs;
  var selectedDevops = ''.obs;

  TextEditingController commentController = TextEditingController();
  TicketUpdateRepository ticketUpdateRepository = TicketUpdateRepository();
  CommentRepository commentRepository = CommentRepository();
  PerformActionRepository performActionRepository = PerformActionRepository();
  DevopsRepository devopsRepository = DevopsRepository();
  ProfileRepository profileRepository = ProfileRepository();

  var devopsLists = <Devops>[].obs;
  var commentList = <Data>[].obs;
  var updatedList = <Updates>[].obs;
  var updatedParticipantsList = <UpdateTicketParticipants>[].obs;
  var roles = <Roles>[].obs;
  var result;
  var currentUserIsDevops = false.obs;
  var changeTicketStatusPermission = false;
  var changeStatus = false.obs;
  String uuidOfCurrentUser = "";
  String uuidOfAssignedUser = "";

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
  String? status;

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

  Future<void> changeTicketStatus(String status) async {
    final repoResponse = await performActionRepository.fetchAllActions(
      uuid!,
      {
        "actionType": "update-info",
        "status": status,
      },
      {
        "Authorization": 'Bearer ${Storage.getUser().access_token}',
      },
    );

    if (repoResponse.error == null) {
      getAllTicketUpdate();
      print("completed!");
    }
  }

  Future<void> assignedToPerformAction(String id) async {
    uuidOfAssignedUser = id;
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
    }
  }

  Future<void> profileDetails() async {
    RepoResponse<MyProfile> repoResponse =
        await profileRepository.getAllProfileDetails({
      "Authorization": 'Bearer ${Storage.getUser().access_token}',
    });

    if (repoResponse.error == null) {
      repoResponse.data?.roles?.forEach((element) {
        if (element.name == 'devops') {
          currentUserIsDevops.value = true;
        }

        roles.add(element);
      });

      uuidOfCurrentUser = repoResponse.data?.id ?? "";
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

      selectedDevops.value = devopsLists.first.id ?? "";
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
    status = data['ticketStatus'];

    ticketStatus.value = status ?? "New";

    fetchAllComments();

    postAllComments();

    // getAllParticipants();

    getAllTicketUpdate();

    fetchAllDevops();

    profileDetails();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
