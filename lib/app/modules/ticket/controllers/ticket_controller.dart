import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/comment.dart';
import 'package:starter/app/data/models/dto/participants_list.dart';
import 'package:starter/app/data/models/dto/participants_list.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/dto/ticket_update.dart';
import 'package:starter/app/data/repository/comment_repository.dart';
import 'package:starter/app/data/repository/participants_repository.dart'
    as parti;
import 'package:starter/app/data/repository/perform_action_repository.dart';
import 'package:starter/app/data/repository/ticket_update_repository.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class TicketController extends GetxController {
  var updatedValue = "In Progress".obs;
  var selectedParticipants = "Aakash Pandey".obs;

  TextEditingController commentController = TextEditingController();
  TicketUpdateRepository ticketUpdateRepository = TicketUpdateRepository();
  CommentRepository commentRepository = CommentRepository();
  PerformActionRepository performActionRepository = PerformActionRepository();

  parti.ParticipantsRepository participantsRepository =
      parti.ParticipantsRepository();

  var commentList = <Data>[].obs;
  var participantsList = <Participants>[].obs;
  var updatedList = <Updates>[].obs;
  var updatedParticipantsList = <UpdateTicketParticipants>[].obs;

  var assignedToUuid = "".obs;

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
    "In Progress",
    "Completed",
  ];

  // participantsList

  final pList = [
    "Aakash Pandey",
    "Abhinav Anshul",
    "Abhipsa Matura",
    "Abul Karim",
    "Ankit Jain",
    "Ankit Kaushik",
    "Nobody Assigned yet"
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

  Future<void> getAllTicketUpdate() async {
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

  Future<void> assignedToPerformAction() async {
    final repoResponse = await performActionRepository.fetchAllActions(
      uuid!,
      {
        "actionType": "update-assignedTo",
        "assignedTo": assignedToUuid,
      },
      {
        "Authorization": 'Bearer ${Storage.getUser().access_token}',
      },
    );

    if (repoResponse.error == null) {
      getAllTicketUpdate();

      print(assignedToUuid);
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

    getAllParticipants();

    getAllTicketUpdate();

    assignedToPerformAction();

    print(assignedToUuid);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
