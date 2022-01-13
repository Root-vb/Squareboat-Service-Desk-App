import 'package:starter/app/data/models/dto/user.dart';

class UserResponse {
  late User? data;
  late int code;

  UserResponse({required this.data, required this.code});

  UserResponse.fromJson(Map<String, dynamic> json) {
    this.data = json['data'] == null ? null : User.fromJson(json['data']);
    this.code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data?.toJson();
    data['code'] = this.code;
    return data;
  }
}
