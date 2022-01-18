import 'package:starter/app/data/models/dto/deployment_ticket.dart';

class CreateDeploymentTicketResponse {
  late DeploymentTicket? data;
  late int code;

  CreateDeploymentTicketResponse({required this.data, required this.code});

  CreateDeploymentTicketResponse.fromJson(Map<String, dynamic> json) {
    this.data =
        json['data'] == null ? null : DeploymentTicket.fromJson(json['data']);
    this.code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data?.toJson();
    data['code'] = this.code;
    return data;
  }
}
