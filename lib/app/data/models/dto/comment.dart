class Comment {
  Pagination? pagination;
  List<Data>? data;

  Comment({this.pagination, this.data});

  Comment.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
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

class Data {
  int? id;
  String? heading;
  String? description;
  int? ticketId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;

  Data(
      {this.id,
      this.heading,
      this.description,
      this.ticketId,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    heading = json['heading'];
    description = json['description'];
    ticketId = json['ticketId'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['heading'] = this.heading;
    data['description'] = this.description;
    data['ticketId'] = this.ticketId;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
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
  String? password;
  String? createdAt;
  String? updatedAt;

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
      this.updatedAt});

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
