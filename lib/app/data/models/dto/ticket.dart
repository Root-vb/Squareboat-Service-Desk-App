class TicketList {
  List<Ticket>? data;
  Pagination? pagination;

  TicketList({this.data, this.pagination});

  TicketList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Ticket>[];
      json['data'].forEach((v) {
        data!.add(new Ticket.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    return data;
  }
}

class Ticket {
  int? id;
  String? uuid;
  String? referenceId;
  String? type;
  String? status;
  int? userId;
  FormFields? formFields;
  List<Participants>? participants;
  String? createdBy;
  String? profilePicture;
  String? createdAt;

  AssignedTo? assignedTo;

  Ticket({
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

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    referenceId = json['referenceId'];
    type = json['type'];
    status = json['status'];
    userId = json['userId'];
    formFields = json['formFields'] != null
        ? new FormFields.fromJson(json['formFields'])
        : null;
    if (json['participants'] != null) {
      participants = <Participants>[];
      json['participants'].forEach((v) {
        participants!.add(new Participants.fromJson(v));
      });
    }
    createdBy = json['createdBy'];
    profilePicture = json['profilePicture'];
    createdAt = json["createdAt"];

    assignedTo = json['assignedTo'] != null
        ? new AssignedTo.fromJson(json['assignedTo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['referenceId'] = this.referenceId;
    data['type'] = this.type;
    data['status'] = this.status;
    data['userId'] = this.userId;
    if (this.formFields != null) {
      data['formFields'] = this.formFields!.toJson();
    }
    if (this.participants != null) {
      data['participants'] = this.participants!.map((v) => v.toJson()).toList();
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
  List<String>? participants;
  String? repoName;
  String? branchName;
  String? environment;
  String? managerName;
  String? projectName;
  String? releaseNotes;
  String? deploymentSteps;
  String? watcher;
  String? releasePriority;

  FormFields({
    this.heading,
    this.description,
    this.participants,
    this.repoName,
    this.branchName,
    this.environment,
    this.managerName,
    this.projectName,
    this.releaseNotes,
    this.watcher,
    this.deploymentSteps,
    this.releasePriority,
  });

  FormFields.fromJson(Map<String, dynamic> json) {
    heading = json['heading'];
    description = json['description'];
    participants = json['participants'].cast<String>();
    repoName = json['repo_name'];
    branchName = json['branch_name'];
    environment = json['environment'];
    managerName = json['manager_name'];
    projectName = json['project_name'];
    releaseNotes = json['release_notes'];
    deploymentSteps = json['deployment_steps'];
    watcher = json['watcher'];
    releasePriority = json['release_priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['heading'] = this.heading;
    data['description'] = this.description;
    data['participants'] = this.participants;
    data['repo_name'] = this.repoName;
    data['branch_name'] = this.branchName;
    data['environment'] = this.environment;
    data['manager_name'] = this.managerName;
    data['project_name'] = this.projectName;
    data['release_notes'] = this.releaseNotes;
    data['deployment_steps'] = this.deploymentSteps;
    data['watcher'] = this.watcher;
    data['release_priority'] = this.releasePriority;
    return data;
  }
}

class Participants {
  String? id;
  String? name;
  String? profilePicture;
  int? organizationId;
  String? status;
  String? email;
  List<String>? roles;

  Participants({
    this.id,
    this.name,
    this.profilePicture,
    this.organizationId,
    this.status,
    this.email,
    this.roles,
  });

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

class Pagination {
  int? currentPage;
  int? totalPages;
  int? perPage;
  int? total;

  Pagination({this.currentPage, this.totalPages, this.perPage, this.total});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    perPage = json['perPage'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentPage'] = this.currentPage;
    data['totalPages'] = this.totalPages;
    data['perPage'] = this.perPage;
    data['total'] = this.total;
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

  AssignedTo({
    this.id,
    this.name,
    this.profilePicture,
    this.organizationId,
    this.status,
    this.email,
  });

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
