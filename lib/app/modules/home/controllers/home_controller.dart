import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/dto/ticket.dart';
import 'package:starter/app/data/repository/ticket_repository.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class HomeController extends GetxController {
  TicketRepository _ticketRepository = TicketRepository();

  var ticketList = <Ticket>[].obs;

  Future<void> allTicket() async {
    ticketList.clear();
    RepoResponse<TicketList> repoResponse =
        await _ticketRepository.fetchAllTicket({
      "Authorization": 'Bearer ${Storage.getUser().access_token}',
    });

    if (repoResponse.error == null) {
      repoResponse.data?.data?.forEach((element) {
        ticketList.add(element);
      });
    }
  }

  @override
  void onInit() {
    allTicket();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
/**
 *  "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OSwidXVpZCI6IjcyY2EzNDFhLTJlNTEtNGVhMi05YTE5LWQ5YzZkZGM4ZDdiMSIsImVtYWlsIjoiYXNod2FuaS5zaW5naEBzcXVhcmVib2F0LmNvbSIsImlhdCI6MTY0MjA1NjQ5NSwiZXhwIjoxNjQyMzE1Njk1fQ.s5fwLHF-P_EEYhng-GHpkO3ZBmNLrNYkbcKi500GVbE",
 */