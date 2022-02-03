import 'package:dio/dio.dart';
import 'package:starter/app/data/models/dto/myprofile.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/response/profile_response.dart';
import 'package:starter/app/data/values/urls.dart';
import 'package:starter/base/base_reposiotry.dart';
import 'package:starter/utils/helper/exception_handler.dart';

class ProfileRepository extends BaseRepositry {
  Future<RepoResponse<MyProfile>> getAllProfileDetails(
      Map<String, dynamic> data) async {
    final response = await controller.get(
      path: URLs.myProfile,
      options: Options(headers: data),
    );
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: ProfileResponse.fromJson(response).data);
  }

  Future<RepoResponse<bool>> updaetMyProfile(
      Map<String, dynamic> updateData, Map<String, dynamic> data) async {
    final response = await controller.patch(
      path: URLs.myProfile,
      data: updateData,
      options: Options(headers: data),
    );
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: true);
  }
}
