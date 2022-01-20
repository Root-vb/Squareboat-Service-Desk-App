class ParticipantsList {
  List<Participants>? data;
  Pagination? pagination;

  ParticipantsList({this.data, this.pagination});

  ParticipantsList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Participants>[];
      json['data'].forEach((v) {
        data!.add(new Participants.fromJson(v));
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

class Participants {
  String? id;
  String? name;
  String? profilePicture;
  int? organizationId;
  String? status;
  String? email;

  Participants({
    this.id,
    this.name,
    this.profilePicture,
    this.organizationId,
    this.status,
    this.email,
  });

  Participants.fromJson(Map<String, dynamic> json) {
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
