import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/devops.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/dto/ticket.dart';
import 'package:starter/app/data/repository/devops_repository.dart';
import 'package:starter/app/data/repository/ticket_repository.dart';
import 'package:starter/utils/loading/loading_utils.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class HomeController extends GetxController {
  TicketRepository _ticketRepository = TicketRepository();
  DevopsRepository devopsRepository = DevopsRepository();

  final scrollController = ScrollController();

  var ticketList = <Ticket>[].obs;
  var devopsLists = <Devops>[].obs;
  final RxList<String> storeStatusList = RxList<String>();
  final RxList<String> assignedDevopsList = RxList<String>();

  var isChecked = ''.obs;

  int? totalPage;
  int currentPage = 1;
  var assignedUserId = ''.obs;

  final statusList = [
    "New",
    "Assigned",
    "Ongoing",
    "Completed",
    "Invalid",
  ];

  addStatus(int index, bool? value) {
    if (value == true) {
      storeStatusList.add(statusList[index]);
    } else {
      storeStatusList.remove(statusList[index]);
    }
  }

  addAssignedDevops(int index, bool? value) {
    if (value == true) {
      assignedDevopsList.add(devopsLists[index].id ?? "");
    } else {
      assignedDevopsList.remove(devopsLists[index].id);
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

  Future<void> allTicket({int? page}) async {
    RepoResponse<TicketList> repoResponse =
        await _ticketRepository.fetchAllTicket(data: {
      "Authorization": 'Bearer ${Storage.getUser().access_token}'
    }, status: {
      'pagination': 'true',
      'page': '$page',
      'assignedTo': assignedDevopsList.join(','),
      'status': storeStatusList.join(','),
    });

    print(assignedDevopsList.join(','));

    if (repoResponse.error == null) {
      repoResponse.data?.data?.forEach((element) {
        ticketList.add(element);
        totalPage = repoResponse.data?.pagination?.totalPages;
      });
    }

    print('length ${ticketList.length}');
  }

  Future<void> onRefresh() async {
    ticketList.clear();
    allTicket();
    currentPage = 1;
  }

  applyFilter() async {
    ticketList.clear();
    LoadingUtils.showLoader();
    await allTicket();
    Get.back();
    LoadingUtils.hideLoader();
  }

  scrollCotrollers() {
    if (scrollController.hasClients) {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // Do API Call

        if (totalPage! >= currentPage) {
          allTicket(page: ++currentPage);

          print(currentPage);
        }
      }
    } else {}
  }

  @override
  void onInit() {
    scrollController.addListener(scrollCotrollers);

    allTicket();
    fetchAllDevops();
    print(Storage.getUser().access_token);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    scrollController.dispose();
  }
}
