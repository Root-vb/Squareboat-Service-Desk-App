class GeneralTicket {
  late String type;
  late String heading;
  late String description;
  late String watcherEmail;

  GeneralTicket({
    required this.type,
    required this.heading,
    required this.description,
    required this.watcherEmail,
  });

  GeneralTicket.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    heading = json['heading'];
    description = json['description'];
    watcherEmail = json["watcherEmail"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['type'] = this.type;
    data['heading'] = this.heading;
    data['description'] = this.description;
    data['watcherEmail'] = this.watcherEmail;

    return data;
  }
}
