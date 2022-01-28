import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:starter/app/app_controller.dart';
import 'package:starter/app/data/models/response/error_response.dart';
import 'package:starter/app/data/values/strings.dart';
import 'package:starter/utils/loading/loading_utils.dart';

class APIException implements Exception {
  final String message;

  APIException({required this.message});
}

class ExceptionHandler {
  ExceptionHandler._privateConstructor();

  static APIException handleError(Exception error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.sendTimeout:
          return APIException(message: ErrorMessages.noInternet);
        case DioErrorType.connectTimeout:
          LoadingUtils().serverNotAvilableDialog();
          return APIException(message: ErrorMessages.connectionTimeout);
        case DioErrorType.response:
          if (error.response?.statusCode == 503) {
            LoadingUtils().serverNotAvilableDialog();

            return APIException(
                message: ErrorResponse.fromJson(error.response?.data).message);
          } else if (error.response?.statusCode == 401 &&
              (ErrorResponse.fromJson(error.response?.data).message ==
                  "Unauthorized")) {
            AppController().showLogoutDialog();

            return APIException(
                message: ErrorResponse.fromJson(error.response?.data).message);
          } else {
            return APIException(
                message: ErrorResponse.fromJson(error.response?.data).message);
          }

        default:
          return APIException(message: ErrorMessages.networkGeneral);
      }
    } else {
      return APIException(message: ErrorMessages.networkGeneral);
    }
  }
}

class HandleError {
  HandleError._privateConstructor();

  static handleError(APIException? error) {
    Get.rawSnackbar(message: error?.message ?? ErrorMessages.networkGeneral);
  }
}
