import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/devops.dart';
import 'package:starter/app/data/models/dto/myprofile.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/dto/ticket.dart';
import 'package:starter/app/data/repository/devops_repository.dart';
import 'package:starter/app/data/repository/profile_repository.dart';
import 'package:starter/app/data/repository/ticket_repository.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/utils/loading/loading_utils.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class HomeController extends GetxController {
  TicketRepository _ticketRepository = TicketRepository();
  DevopsRepository devopsRepository = DevopsRepository();
  ProfileRepository profileRepository = ProfileRepository();
  final scrollController = ScrollController();

  var ticketList = <Ticket>[].obs;
  var devopsLists = <Devops>[].obs;
  List<String> storeStatusList = <String>[];
  var tempStoreStatusList = <String>[].obs;
  List<String> assignedDevopsList = <String>[];
  var tempAssignedDevopsList = <String>[].obs;

  var isChecked = ''.obs;
  var isUserIsAdmin = false.obs;

  RxBool isLoading = false.obs;

  int? totalPage;
  int currentPage = 1;

  final statusList = [
    "New",
    "Assigned",
    "Ongoing",
    "Completed",
    "Invalid",
  ];

  addStatus(int index, bool? value) {
    if (value == true) {
      tempStoreStatusList.add(statusList[index]);
    } else {
      tempStoreStatusList.remove(statusList[index]);
    }
  }

  addAssignedDevops(int index, bool? value) {
    if (value == true) {
      tempAssignedDevopsList.add(devopsLists[index].id ?? "");
    } else {
      tempAssignedDevopsList.remove(devopsLists[index].id);
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
    // tempStoreStatusList.addAll(storeStatusList);

    isLoading.value = true;

    RepoResponse<TicketList> repoResponse =
        await _ticketRepository.fetchAllTicket(data: {
      "Authorization": 'Bearer ${Storage.getUser().access_token}'
    }, status: {
      'pagination': 'true',
      'page': '$page',
      'assignedTo':
          assignedDevopsList.length == 0 ? '' : assignedDevopsList.join(','),
      'status': storeStatusList.length == 0 ? '' : storeStatusList.join(','),
    });

    isLoading.value = false;

    if (repoResponse.error == null) {
      repoResponse.data?.data?.forEach((element) {
        ticketList.add(element);
        totalPage = repoResponse.data?.pagination?.totalPages;
      });
    }
  }

  Future<void> profileDetails() async {
    RepoResponse<MyProfile> repoResponse =
        await profileRepository.getAllProfileDetails({
      "Authorization": 'Bearer ${Storage.getUser().access_token}',
    });

    if (repoResponse.error == null) {
      repoResponse.data?.roles?.forEach((element) {
        if (element.name == "organization_admin") {
          isUserIsAdmin.value = true;
        } else {
          isUserIsAdmin.value = false;
        }
      });
    }
  }

  Future<void> onRefresh() async {
    ticketList.clear();
    allTicket();
    currentPage = 1;
  }

  Future<void> applyFilter() async {
    ticketList.clear();
    LoadingUtils.showLoader();

    storeStatusList.clear();
    assignedDevopsList.clear();

    storeStatusList.addAll(tempStoreStatusList);
    assignedDevopsList.addAll(tempAssignedDevopsList);

    currentPage = 1;

    await allTicket();

    Get.back();
    LoadingUtils.hideLoader();
  }

  updateFilter() {
    tempStoreStatusList.clear();
    tempAssignedDevopsList.clear();

    tempStoreStatusList.addAll(storeStatusList);
    tempAssignedDevopsList.addAll(assignedDevopsList);
  }

  LoadingStates pageState() {
    if (isLoading.value && ticketList.isEmpty) {
      return LoadingStates.LOADING;
    } else if ((!(isLoading.value) && ticketList.isEmpty)) {
      return LoadingStates.EMPTY;
    } else {
      return LoadingStates.LIST;
    }
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

  cancelButton() {
    // if (tempStoreStatusList.isEmpty) {
    //   storeStatusList.clear();
    // }
    // else {
    //   for (var i = 0; i < storeStatusList.length; i++) {
    //     for (var j = 0; j < tempStoreStatusList.length; j++) {
    //       if (storeStatusList[i] != tempStoreStatusList[j]) {
    //         print(tempStoreStatusList[j]);
    //         storeStatusList.removeAt(j);
    //       }
    //     }
    //   }
    // }

    Get.back();
  }

  @override
  void onInit() {
    scrollController.addListener(scrollCotrollers);

    allTicket();
    fetchAllDevops();
    profileDetails();

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
