import 'package:starter/app/data/models/dto/comment.dart';

class CommentResponse {
  late Comment? data;
  late int code;

  CommentResponse({required this.data, required this.code});

  CommentResponse.fromJson(Map<String, dynamic> json) {
    this.data = json['data'] == null ? null : Comment.fromJson(json['data']);
    this.code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data?.toJson();
    data['code'] = this.code;
    return data;
  }
}
