import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/dto/ticket_dto.dart';
import 'package:starter/app/data/network/network_requester.dart';
import 'package:starter/app/data/repository/ticket_repository.dart';

class HomeController extends GetxController {
  var ticketList = <TicketDto>[].obs;
  NetworkRequester _networkRequester = NetworkRequester();
  TicketRepository _ticketRepository = TicketRepository();

  getAllTickets(String token) async {
    var response = _networkRequester.get(
        path: "https://api.service-desk.squareboat.info/tickets?=",
        options: Options(headers: {
          "Authorization": 'Bearer $token',
        }));

    print(token);

    print(response);
  }

  allTicket(String data) async {
    RepoResponse repoResponse = await _ticketRepository.fetchAllTicket({
      "Authorization": data,
    });

    if (repoResponse.error == null) {
      log(repoResponse.data);
    }
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
