import 'package:starter/app/data/models/dto/ticket_update.dart';

class TicketUpdateResponse {
  late TicketUpdate? data;
  late int code;

  TicketUpdateResponse({required this.data, required this.code});

  TicketUpdateResponse.fromJson(Map<String, dynamic> json) {
    this.data =
        json['data'] == null ? null : TicketUpdate.fromJson(json['data']);
    this.code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data?.toJson();
    data['code'] = this.code;
    return data;
  }
}
