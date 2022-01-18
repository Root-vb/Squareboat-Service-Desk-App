import 'package:starter/app/data/models/dto/general_ticket.dart';

class CreateGeneralTicketResponse {
  late GeneralTicket? data;
  late int code;

  CreateGeneralTicketResponse({required this.data, required this.code});

  CreateGeneralTicketResponse.fromJson(Map<String, dynamic> json) {
    this.data =
        json['data'] == null ? null : GeneralTicket.fromJson(json['data']);
    this.code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data?.toJson();
    data['code'] = this.code;
    return data;
  }
}
