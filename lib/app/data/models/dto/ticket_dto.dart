class TicketDto {
  TicketDto({
    this.id,
    this.uuid,
    this.referenceId,
    this.type,
    this.status,
    this.userId,
    this.formFields,
    this.participants,
    this.createdBy,
    this.profilePicture,
    this.createdAt,
    this.assignedTo,
  });

  int? id;
  String? uuid;
  dynamic referenceId;
  String? type;
  String? status;
  int? userId;
  FormFields? formFields;
  List<Participants>? participants;
  String? createdBy;
  String? profilePicture;
  DateTime? createdAt;
  AssignedTo? assignedTo;

  factory TicketDto.fromJson(Map<String, dynamic> json) => TicketDto(
        id: json["id"],
        uuid: json["uuid"],
        referenceId: json["referenceId"],
        type: json["type"],
        status: json["status"],
        userId: json["userId"],
        formFields: FormFields.fromJson(json["formFields"]),
        participants: List<Participants>.from(
            json["participants"].map((x) => Participants.fromJson(x))),
        createdBy: json["createdBy"],
        profilePicture: json["profilePicture"],
        createdAt: DateTime.parse(json["createdAt"]),
        assignedTo: AssignedTo.fromJson(
          json["assignedTo"],
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "referenceId": referenceId,
        "type": type,
        "status": status,
        "userId": userId,
        "formFields": formFields!.toJson(),
        "participants":
            List<dynamic>.from(participants!.map((x) => x.toJson())),
        "createdBy": createdBy,
        "profilePicture": profilePicture,
        "createdAt": createdAt!.toIso8601String(),
        "assignedTo": assignedTo!.toJson(),
      };
}

class Participants {
  String? id;
  String? name;
  String? profilePicture;
  int? organizationId;
  String? status;
  String? email;
  List<String>? roles;

  Participants(
      {this.id,
      this.name,
      this.profilePicture,
      this.organizationId,
      this.status,
      this.email,
      this.roles});

  Participants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePicture = json['profilePicture'];
    organizationId = json['organizationId'];
    status = json['status'];
    email = json['email'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profilePicture'] = this.profilePicture;
    data['organizationId'] = this.organizationId;
    data['status'] = this.status;
    data['email'] = this.email;
    data['roles'] = this.roles;
    return data;
  }
}

class FormFields {
  String? heading;
  String? description;
  List<Participants>? participants;

  FormFields({this.heading, this.description, this.participants});

  FormFields.fromJson(Map<String, dynamic> json) {
    heading = json['heading'];
    description = json['description'];
    if (json['participants'] != null) {
      participants = <Participants>[];
      json['participants'].forEach((v) {
        participants!.add(new Participants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['heading'] = this.heading;
    data['description'] = this.description;
    if (this.participants != null) {
      data['participants'] = this.participants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AssignedTo {
  String? id;
  String? name;
  String? profilePicture;
  int? organizationId;
  String? status;
  String? email;

  AssignedTo(
      {this.id,
      this.name,
      this.profilePicture,
      this.organizationId,
      this.status,
      this.email});

  AssignedTo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePicture = json['profilePicture'];
    organizationId = json['organizationId'];
    status = json['status'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profilePicture'] = this.profilePicture;
    data['organizationId'] = this.organizationId;
    data['status'] = this.status;
    data['email'] = this.email;
    return data;
  }
}
