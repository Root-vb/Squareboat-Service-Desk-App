import 'package:starter/app/data/models/dto/comment.dart';
import 'package:starter/app/data/models/dto/participants_list.dart';

class ParticipantsResponse {
  late ParticipantsList? data;
  late int code;

  ParticipantsResponse({required this.data, required this.code});

  ParticipantsResponse.fromJson(Map<String, dynamic> json) {
    this.data =
        json['data'] == null ? null : ParticipantsList.fromJson(json['data']);
    this.code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data?.toJson();
    data['code'] = this.code;
    return data;
  }
}
