import 'package:starter/app/data/models/dto/ticket_dto.dart';

class TicketResponse {
  late TicketDto? data;
  late int code;

  TicketResponse({required this.data, required this.code});

  TicketResponse.fromJson(Map<String, dynamic> json) {
    this.data = json['data'] == null ? null : TicketDto.fromJson(json['data']);
    this.code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data?.toJson();
    data['code'] = this.code;
    return data;
  }
}
