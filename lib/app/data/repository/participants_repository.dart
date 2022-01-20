import 'package:dio/dio.dart';
import 'package:starter/app/data/models/dto/participants_list.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/response/participants_response.dart';
import 'package:starter/app/data/values/urls.dart';
import 'package:starter/base/base_reposiotry.dart';
import 'package:starter/utils/helper/exception_handler.dart';

class ParticipantsRepository extends BaseRepositry {
  Future<RepoResponse<ParticipantsList>> fetchAllPartcipants(
      Map<String, dynamic> data) async {
    final response = await controller.get(
      path: URLs.partcipantsUrl,
      options: Options(headers: data),
    );
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: ParticipantsResponse.fromJson(response).data);
  }
}
