import 'package:starter/app/data/models/dto/ticket.dart';

class TicketResponse {
  late TicketList? data;
  late int code;

  TicketResponse({required this.data, required this.code});

  TicketResponse.fromJson(Map<String, dynamic> json) {
    this.data = json['data'] == null ? null : TicketList.fromJson(json['data']);
    this.code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data?.toJson();
    data['code'] = this.code;
    return data;
  }
}
