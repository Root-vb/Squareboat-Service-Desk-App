import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/comment.dart';
import 'package:starter/app/data/models/dto/devops.dart';
import 'package:starter/app/data/models/dto/myprofile.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/dto/ticket_update.dart';
import 'package:starter/app/data/repository/comment_repository.dart';
import 'package:starter/app/data/repository/delete_comment_repository.dart';
import 'package:starter/app/data/repository/delete_ticket_repository.dart';
import 'package:starter/app/data/repository/devops_repository.dart';
import 'package:starter/app/data/repository/perform_action_repository.dart';
import 'package:starter/app/data/repository/profile_repository.dart';
import 'package:starter/app/data/repository/ticket_update_repository.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/utils/helper/text_field_wrapper.dart';
import 'package:starter/utils/loading/loading_utils.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class TicketController extends GetxController {
  var ticketStatus = "New".obs;
  var selectedDevops = ''.obs;

  TicketUpdateRepository ticketUpdateRepository = TicketUpdateRepository();
  CommentRepository commentRepository = CommentRepository();
  PerformActionRepository performActionRepository = PerformActionRepository();
  DeleteTicketRepository deleteTicketRepository = DeleteTicketRepository();
  DeleteCommentRepository deleteCommentRepository = DeleteCommentRepository();
  DevopsRepository devopsRepository = DevopsRepository();
  ProfileRepository profileRepository = ProfileRepository();
  TextFieldWrapper commentWrapper = TextFieldWrapper();

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
  String errorText = "Please fill in this feild";
  String createdTicketUuid = "";
  var isCommentCreatedByCurrentUser = false.obs;

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
  String? assignedToId;

  final items = [
    "New",
    "Assigned",
    "Ongoing",
    "Completed",
    "Invalid",
  ];

  bool validator() {
    bool hasError = false;

    if (commentWrapper.controller.text.isEmpty) {
      commentWrapper.errorText = errorText;
      hasError = true;
    }

    return hasError;
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
        if (element.name == 'organization_admin') {
          currentUserIsDevops.value = true;
        }

        roles.add(element);
      });

      uuidOfCurrentUser = repoResponse.data?.id ?? "";
    }
  }

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

      for (var i = 0; i < commentList.length; i++) {
        if (commentList[i].user?.uuid == uuidOfCurrentUser) {
          isCommentCreatedByCurrentUser.value = true;
        } else {
          isCommentCreatedByCurrentUser.value = false;
        }
      }
    }
  }

  Future<void> postAllComments(BuildContext context) async {
    final hasError = validator();

    if (hasError) {
      return;
    }

    LoadingUtils.showLoader();

    final response = await commentRepository.postComments(uuid!, {
      "description": commentWrapper.controller.text,
    }, {
      "Authorization": 'Bearer ${Storage.getUser().access_token}',
    });

    LoadingUtils.hideLoader();

    FocusScope.of(context).unfocus();

    if (response.error == null) {
      fetchAllComments();
    }

    commentWrapper.controller.clear();
  }

  Future<void> onRefresh() async {
    fetchAllComments();
    // postAllComments(context);
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

      createdTicketUuid = repoResponse.data?.user?.uuid ?? "";

      repoResponse.data?.participants?.forEach((element) {
        updatedParticipantsList.add(element);
        print(element.name);
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

      // devopsLists.insert(0, "");

      selectedDevops.value = devopsLists.first.id ?? "";
    }
  }

  launchParticipants() async {
    List<String> allParticipantsUuid = [];

    updatedParticipantsList.forEach((element) {
      allParticipantsUuid.add(element.id ?? "");
    });
    result = await Get.toNamed(Routes.PARTICIPANTS, arguments: {
      "listOfPartcipants": allParticipantsUuid,
      "uuidOfTicketCreator": createdTicketUuid,
    });

    if (result != null) {
      addPartcipantsPerformAction(result);
    }
  }

  Future<void> addPartcipantsPerformAction(List<String>? user) async {
    List<String> listOfParticipants = [];

    listOfParticipants.add(Storage.getUser().id);
    listOfParticipants.addAll(user ?? []);

    listOfParticipants.forEach((element) {
      print("parti $element");
    });

    List<String> users = listOfParticipants.toSet().toList();

    users.forEach((element) {
      print("ele $element");
    });

    final repoResponse = await performActionRepository.fetchAllActions(
      uuid!,
      {
        "actionType": "update-user",
        "users": users.length == 1 ? [users] : users,
      },
      {"Authorization": 'Bearer ${Storage.getUser().access_token}'},
    );

    if (repoResponse.error == null) {
      getAllTicketUpdate();
    }
  }

  Future<void> ticketDelete() async {
    final repoResponse = deleteTicketRepository.deleteTicket(
      uuid!,
      {
        "Authorization": 'Bearer ${Storage.getUser().access_token}',
      },
    );

    if (repoResponse != null) {
      Get.offAllNamed(Routes.DASHBOARD);

      print("deleted");
    }
  }

  Future<void> deleteComment(int commentId) async {
    final repoResponse = deleteCommentRepository.deleteComments(
      commentId,
      {
        "Authorization": 'Bearer ${Storage.getUser().access_token}',
      },
    );

    if (repoResponse != null) {
      // Get.offAllNamed(Routes.HOME);
      fetchAllComments();

      print("deleted");
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
    assignedToId = data['assignedTo'];

    print(email);

    ticketStatus.value = status ?? "New";

    profileDetails();

    fetchAllComments();

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
