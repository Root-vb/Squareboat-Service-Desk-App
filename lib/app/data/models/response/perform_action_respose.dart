import 'package:starter/app/data/models/dto/perform_action.dart';

class PerformActionResponse {
  late PerformAction? data;
  late int code;

  PerformActionResponse({required this.data, required this.code});

  PerformActionResponse.fromJson(Map<String, dynamic> json) {
    this.data =
        json['data'] == null ? null : PerformAction.fromJson(json['data']);
    this.code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data?.toJson();
    data['code'] = this.code;
    return data;
  }
}
