import 'package:dio/dio.dart';
import 'package:starter/app/data/models/dto/devops.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/response/devops_response.dart';
import 'package:starter/app/data/values/urls.dart';
import 'package:starter/base/base_reposiotry.dart';
import 'package:starter/utils/helper/exception_handler.dart';

class DevopsRepository extends BaseRepositry {
  Future<RepoResponse<DevopsList>> getAllDevopsDetails(
      Map<String, dynamic> data) async {
    final response = await controller.get(
      path: URLs.devopsUrl,
      options: Options(headers: data),
    );
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: DevopsResponse.fromJson(response).data);
  }
}
