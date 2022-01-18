import 'package:dio/dio.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/values/urls.dart';
import 'package:starter/base/base_reposiotry.dart';
import 'package:starter/utils/helper/exception_handler.dart';

class CreateTicketRepository extends BaseRepositry {
  Future<RepoResponse<bool>> createGeneralTicket(
    Map<String, dynamic> data,
    Map<String, dynamic> token,
  ) async {
    final response = await controller.post(
      path: URLs.createGeneralTicket,
      data: data,
      options: Options(
        headers: token,
      ),
    );

    print(response);

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(
            data: true,
          );
  }

  Future<RepoResponse<bool>> createDeploymentTicket(
    Map<String, dynamic> data,
    Map<String, dynamic> token,
  ) async {
    final response = await controller.post(
      path: URLs.createDeploymentTicketUrl,
      data: data,
      options: Options(
        headers: token,
      ),
    );

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(
            data: true,
          );
  }
}
