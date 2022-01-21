import 'package:starter/app/data/models/dto/devops.dart';

class DevopsResponse {
  late DevopsList? data;
  late int code;

  DevopsResponse({required this.data, required this.code});

  DevopsResponse.fromJson(Map<String, dynamic> json) {
    this.data = json['data'] == null ? null : DevopsList.fromJson(json['data']);
    this.code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data?.toJson();
    data['code'] = this.code;
    return data;
  }
}
