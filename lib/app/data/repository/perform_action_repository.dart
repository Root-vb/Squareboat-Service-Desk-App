import 'package:dio/dio.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/values/urls.dart';
import 'package:starter/base/base_reposiotry.dart';
import 'package:starter/utils/helper/exception_handler.dart';

class PerformActionRepository extends BaseRepositry {
  Future<RepoResponse<bool>> fetchAllActions(
    String ticketId,
    Map<String, dynamic> action,
    Map<String, dynamic> data,
  ) async {
    final response = await controller.patch(
      path: URLs.performAction + "$ticketId/perform-action",
      data: action,
      options: Options(headers: data),
    );
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: true);
  }
}
