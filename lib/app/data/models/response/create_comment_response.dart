import 'package:starter/app/data/models/dto/create_comment.dart';

class CreateCommentResponse {
  late CreateComments? data;
  late int code;

  CreateCommentResponse({required this.data, required this.code});

  CreateCommentResponse.fromJson(Map<String, dynamic> json) {
    this.data =
        json['data'] == null ? null : CreateComments.fromJson(json['data']);
    this.code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data?.toJson();
    data['code'] = this.code;
    return data;
  }
}
