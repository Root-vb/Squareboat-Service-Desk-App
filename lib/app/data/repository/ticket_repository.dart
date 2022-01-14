import 'package:dio/dio.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/dto/ticket.dart';
import 'package:starter/app/data/models/response/ticket_response.dart';
import 'package:starter/app/data/values/urls.dart';
import 'package:starter/base/base_reposiotry.dart';
import 'package:starter/utils/helper/exception_handler.dart';

class TicketRepository extends BaseRepositry {
  Future<RepoResponse<TicketList>> fetchAllTicket(
      Map<String, dynamic> data) async {
    final response = await controller.get(
      path: URLs.ticketUrl,
      options: Options(headers: data),
    );
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: TicketResponse.fromJson(response).data);
  }
}
