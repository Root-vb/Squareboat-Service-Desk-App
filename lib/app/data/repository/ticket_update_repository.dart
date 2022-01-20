import 'package:dio/dio.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/dto/ticket_update.dart';
import 'package:starter/app/data/models/response/ticket_update_response.dart';
import 'package:starter/app/data/values/urls.dart';
import 'package:starter/base/base_reposiotry.dart';
import 'package:starter/utils/helper/exception_handler.dart';

class TicketUpdateRepository extends BaseRepositry {
  Future<RepoResponse<TicketUpdate>> fetchAllTicketUpdate(
      String ticketId, Map<String, dynamic> data) async {
    final response = await controller.get(
      path: URLs.updateTicketUrl + '$ticketId',
      options: Options(headers: data),
    );
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: TicketUpdateResponse.fromJson(response).data);
  }
}
