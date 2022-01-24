import 'package:starter/app/data/models/dto/myprofile.dart';

class ProfileResponse {
  late MyProfile? data;
  late int code;

  ProfileResponse({required this.data, required this.code});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    this.data = json['data'] == null ? null : MyProfile.fromJson(json['data']);
    this.code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data?.toJson();
    data['code'] = this.code;
    return data;
  }
}
