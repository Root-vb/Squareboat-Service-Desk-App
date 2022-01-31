import 'package:dio/dio.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/values/urls.dart';
import 'package:starter/base/base_reposiotry.dart';
import 'package:starter/utils/helper/exception_handler.dart';

class DeleteTicketRepository extends BaseRepositry {
  Future<RepoResponse<bool>> deleteTicket(
    String ticketId,
    Map<String, dynamic> data,
  ) async {
    final response = await controller.patch(
      path: URLs.deleteTicket + "$ticketId/delete",
      options: Options(headers: data),
    );
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: true);
  }
}
