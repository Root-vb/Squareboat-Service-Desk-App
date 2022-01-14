import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/dto/ticket.dart';
import 'package:starter/app/data/repository/ticket_repository.dart';
import 'package:starter/utils/storage/storage_utils.dart';

class HomeController extends GetxController {
  TicketRepository _ticketRepository = TicketRepository();

  RxList<Ticket> ticketList = <Ticket>[].obs;

  allTicket() async {
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
    print(Storage.getUser().access_token);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
