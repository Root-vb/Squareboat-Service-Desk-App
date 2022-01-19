import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/dto/ticket.dart';
import 'package:starter/app/data/repository/ticket_repository.dart';
import 'package:starter/app/data/values/urls.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class HomeController extends GetxController {
  TicketRepository _ticketRepository = TicketRepository();

  var ticketList = <Ticket>[].obs;

  final scrollController = ScrollController();

  int? totalPage;
  int currentPage = 1;

  double offSet = 0.0;

  Future<void> allTicket() async {
    ticketList.clear();
    RepoResponse<TicketList> repoResponse =
        await _ticketRepository.fetchAllTicket({
      "Authorization": 'Bearer ${Storage.getUser().access_token}',
    });

    if (repoResponse.error == null) {
      repoResponse.data?.data?.forEach((element) {
        ticketList.add(element);

        totalPage = repoResponse.data?.pagination?.totalPages;
      });
    }
    currentPage = 1;
  }

  Future<void> paginatedTickets(int page) async {
    RepoResponse<TicketList> repoResponse =
        await _ticketRepository.fetchAllPageTicket(
      URLs.paginatedTicketUrl + '$page',
      {
        "Authorization": 'Bearer ${Storage.getUser().access_token}',
      },
    );

    if (repoResponse.error == null) {
      repoResponse.data?.data?.forEach((element) {
        ticketList.add(element);
      });
    }
  }

  scrollCotrollers() {
    if (scrollController.hasClients) {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        // Do API Call

        if (totalPage! >= currentPage) {
          paginatedTickets(currentPage + 1);
          currentPage++;
        }
      }
    } else {}
  }

  @override
  void onInit() {
    scrollController.addListener(scrollCotrollers);

    allTicket();

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
/**
 *  "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwidXVpZCI6IjcyY2EzNDFhLTJlNTEtNGVhMi05YTE5LWQ5YzZkZGM4ZDdiMSIsImVtYWlsIjoiYXNod2FuaS5zaW5naEBzcXVhcmVib2F0LmNvbSIsImlhdCI6MTY0MjA1NjQ5NSwiZXhwIjoxNjQyMzE1Njk1fQ.s5fwLHF-P_EEYhng-GHpkO3ZBmNLrNYkbcKi500GVbE",
 */