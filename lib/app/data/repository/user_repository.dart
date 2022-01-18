import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/dto/user.dart';
import 'package:starter/app/data/models/request/auth_request.dart';
import 'package:starter/app/data/models/response/user_response.dart';
import 'package:starter/app/data/values/urls.dart';
import 'package:starter/base/base_reposiotry.dart';
import 'package:starter/utils/helper/exception_handler.dart';

class UserRepository extends BaseRepositry {
  Future<RepoResponse<bool>> sendOTP(SendOTPRequest data) async {
    final response =
        await controller.post(path: URLs.sendOTP, data: data.toJson());

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: true);
  }

  Future<RepoResponse<User?>> verifyOTP(VerifyOTPRequest data) async {
    final response =
        await controller.post(path: URLs.verifyOTP, data: data.toJson());

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: UserResponse.fromJson(response).data);
  }

  Future<RepoResponse<User>> login(Map<String, dynamic> data) async {
    final response = await controller.post(path: URLs.login, data: data);

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: UserResponse.fromJson(response).data);
  }
}
