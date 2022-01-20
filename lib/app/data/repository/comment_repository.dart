import 'package:dio/dio.dart';
import 'package:starter/app/data/models/dto/comment.dart';
import 'package:starter/app/data/models/dto/create_comment.dart';
import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/response/comment_response.dart';
import 'package:starter/app/data/models/response/create_comment_response.dart';
import 'package:starter/app/data/values/urls.dart';
import 'package:starter/base/base_reposiotry.dart';
import 'package:starter/utils/helper/exception_handler.dart';

class CommentRepository extends BaseRepositry {
  Future<RepoResponse<Comment>> getAllComments(
    String ticketId,
    Map<String, dynamic> data,
  ) async {
    final response = await controller.get(
      path: URLs.getCommentUrl + "$ticketId/comments?=",
      options: Options(headers: data),
    );
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: CommentResponse.fromJson(response).data);
  }

  Future<RepoResponse<bool>> postComments(
    String ticketId,
    Map<String, dynamic> description,
    Map<String, dynamic> data,
  ) async {
    final response = await controller.post(
      path: URLs.postCommentUrl + "$ticketId/comments?=",
      data: description,
      options: Options(headers: data),
    );

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: true);
  }
}
