import 'dart:convert';

class TicketDto {
  TicketDto({
    this.id,
    this.uuid,
    this.referenceId,
    this.type,
    this.status,
    this.userId,
    // this.formFields,
    // this.participants,
    this.createdBy,
    this.profilePicture,
    this.createdAt,
    // this.assignedTo,
  });

  int? id;
  String? uuid;
  dynamic referenceId;
  String? type;
  String? status;
  int? userId;
  // FormFields? formFields;
  // List<Participant>? participants;
  String? createdBy;
  String? profilePicture;
  DateTime? createdAt;
  // AssignedTo? assignedTo;

  factory TicketDto.fromJson(Map<String, dynamic> json) => TicketDto(
        id: json["id"],
        uuid: json["uuid"],
        referenceId: json["referenceId"],
        type: json["type"],
        status: json["status"],
        userId: json["userId"],
        // formFields: FormFields.fromJson(json["formFields"]),
        // participants: List<Participant>.from(
        //     json["participants"].map((x) => Participant.fromJson(x))),
        createdBy: json["createdBy"],
        profilePicture: json["profilePicture"],
        createdAt: DateTime.parse(json["createdAt"]),
        // assignedTo: AssignedTo.fromJson(
        //   json["assignedTo"],
        // ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "referenceId": referenceId,
        "type": type,
        "status": status,
        "userId": userId,
        // "formFields": formFields!.toJson(),
        // "participants":
        //     List<dynamic>.from(participants!.map((x) => x.toJson())),
        "createdBy": createdBy,
        "profilePicture": profilePicture,
        "createdAt": createdAt!.toIso8601String(),
        // "assignedTo": assignedTo!.toJson(),
      };
}
