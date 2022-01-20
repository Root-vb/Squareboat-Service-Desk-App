class TicketUpdate {
  int? id;
  String? uuid;
  String? type;
  String? status;
  int? userId;
  FormFields? formFields;
  List<UpdateTicketParticipants>? participants;
  List<Updates>? updates;
  User? user;
  String? createdBy;
  String? profilePicture;
  String? createdAt;
  AssignedTo? assignedTo;

  TicketUpdate({
    this.id,
    this.uuid,
    this.type,
    this.status,
    this.userId,
    this.formFields,
    this.participants,
    this.updates,
    this.user,
    this.createdBy,
    this.profilePicture,
    this.createdAt,
    this.assignedTo,
  });

  TicketUpdate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    type = json['type'];
    status = json['status'];
    userId = json['userId'];
    formFields = json['formFields'] != null
        ? new FormFields.fromJson(json['formFields'])
        : null;
    if (json['participants'] != null) {
      participants = <UpdateTicketParticipants>[];
      json['participants'].forEach((v) {
        participants!.add(new UpdateTicketParticipants.fromJson(v));
      });
    }
    if (json['updates'] != null) {
      updates = <Updates>[];
      json['updates'].forEach((v) {
        updates!.add(new Updates.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    createdBy = json['createdBy'];
    profilePicture = json['profilePicture'];
    createdAt = json['createdAt'];
    assignedTo = json['assignedTo'] != null
        ? new AssignedTo.fromJson(json['assignedTo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['type'] = this.type;
    data['status'] = this.status;
    data['userId'] = this.userId;
    if (this.formFields != null) {
      data['formFields'] = this.formFields!.toJson();
    }
    if (this.participants != null) {
      data['participants'] = this.participants!.map((v) => v.toJson()).toList();
    }
    if (this.updates != null) {
      data['updates'] = this.updates!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['createdBy'] = this.createdBy;
    data['profilePicture'] = this.profilePicture;
    data['createdAt'] = this.createdAt;
    if (this.assignedTo != null) {
      data['assignedTo'] = this.assignedTo!.toJson();
    }
    return data;
  }
}

class FormFields {
  String? heading;
  String? description;
  List<UpdateTicketParticipants>? participants;

  FormFields({this.heading, this.description, this.participants});

  FormFields.fromJson(Map<String, dynamic> json) {
    heading = json['heading'];
    description = json['description'];
    if (json['participants'] != null) {
      participants = <UpdateTicketParticipants>[];
      json['participants'].forEach((v) {
        participants!.add(new UpdateTicketParticipants.fromJson(v));
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

class UpdateTicketParticipants {
  String? id;
  String? name;
  String? profilePicture;
  int? organizationId;
  String? status;
  String? email;
  List<String>? roles;

  UpdateTicketParticipants(
      {this.id,
      this.name,
      this.profilePicture,
      this.organizationId,
      this.status,
      this.email,
      this.roles});

  UpdateTicketParticipants.fromJson(Map<String, dynamic> json) {
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

class Updates {
  int? id;
  String? fieldName;
  String? oldValue;
  String? newValue;
  int? ticketId;
  String? userId;
  String? createdAt;
  String? updatedAt;
  UpdatedBy? updatedBy;

  Updates(
      {this.id,
      this.fieldName,
      this.oldValue,
      this.newValue,
      this.ticketId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.updatedBy});

  Updates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fieldName = json['fieldName'];
    oldValue = json['oldValue'];
    newValue = json['newValue'];
    ticketId = json['ticketId'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'] != null
        ? new UpdatedBy.fromJson(json['updatedBy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fieldName'] = this.fieldName;
    data['oldValue'] = this.oldValue;
    data['newValue'] = this.newValue;
    data['ticketId'] = this.ticketId;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.updatedBy != null) {
      data['updatedBy'] = this.updatedBy!.toJson();
    }
    return data;
  }
}

class UpdatedBy {
  int? id;
  String? uuid;
  String? name;
  String? profilePicture;
  int? organizationId;
  String? status;
  String? email;
  Null? password;
  String? createdAt;
  String? updatedAt;

  UpdatedBy(
      {this.id,
      this.uuid,
      this.name,
      this.profilePicture,
      this.organizationId,
      this.status,
      this.email,
      this.password,
      this.createdAt,
      this.updatedAt});

  UpdatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    profilePicture = json['profilePicture'];
    organizationId = json['organizationId'];
    status = json['status'];
    email = json['email'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['profilePicture'] = this.profilePicture;
    data['organizationId'] = this.organizationId;
    data['status'] = this.status;
    data['email'] = this.email;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? uuid;
  String? name;
  String? profilePicture;
  int? organizationId;
  String? status;
  String? email;
  Null? password;
  String? createdAt;
  String? updatedAt;
  List<Roles>? roles;

  User(
      {this.id,
      this.uuid,
      this.name,
      this.profilePicture,
      this.organizationId,
      this.status,
      this.email,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.roles});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    profilePicture = json['profilePicture'];
    organizationId = json['organizationId'];
    status = json['status'];
    email = json['email'];
    password = json['password'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['profilePicture'] = this.profilePicture;
    data['organizationId'] = this.organizationId;
    data['status'] = this.status;
    data['email'] = this.email;
    data['password'] = this.password;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  int? id;
  String? uuid;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<HavePermission>? havePermission;

  Roles(
      {this.id,
      this.uuid,
      this.name,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.havePermission});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['havePermission'] != null) {
      havePermission = <HavePermission>[];
      json['havePermission'].forEach((v) {
        havePermission!.add(new HavePermission.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.havePermission != null) {
      data['havePermission'] =
          this.havePermission!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HavePermission {
  int? id;
  String? uuid;
  String? scope;
  Null? description;
  String? createdAt;
  String? updatedAt;

  HavePermission(
      {this.id,
      this.uuid,
      this.scope,
      this.description,
      this.createdAt,
      this.updatedAt});

  HavePermission.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    scope = json['scope'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['scope'] = this.scope;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
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
