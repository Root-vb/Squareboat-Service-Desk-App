class MyProfile {
  String? id;
  String? name;
  String? profilePicture;
  int? organizationId;
  String? status;
  String? email;
  List<Roles>? roles;
  Organization? organization;

  MyProfile({
    this.id,
    this.name,
    this.profilePicture,
    this.organizationId,
    this.status,
    this.email,
    this.roles,
    this.organization,
  });

  MyProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profilePicture = json['profilePicture'];
    organizationId = json['organizationId'];
    status = json['status'];
    email = json['email'];
    if (json['roles'] != null) {
      roles = <Roles>[];
      json['roles'].forEach((v) {
        roles!.add(new Roles.fromJson(v));
      });
    }

    organization = json['organization'] != null
        ? new Organization.fromJson(json['organization'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['profilePicture'] = this.profilePicture;
    data['organizationId'] = this.organizationId;
    data['status'] = this.status;
    data['email'] = this.email;
    if (this.roles != null) {
      data['roles'] = this.roles!.map((v) => v.toJson()).toList();
    }

    if (this.organization != null) {
      data['organization'] = this.organization!.toJson();
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

  Roles({
    this.id,
    this.uuid,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.havePermission,
  });

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
  String? description;
  String? createdAt;
  String? updatedAt;

  HavePermission({
    this.id,
    this.uuid,
    this.scope,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

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

class Organization {
  int? id;
  String? uuid;
  String? name;
  String? prefix;
  int? count;
  String? logo;
  String? status;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Organization({
    this.id,
    this.uuid,
    this.name,
    this.prefix,
    this.count,
    this.logo,
    this.status,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  Organization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    prefix = json['prefix'];
    count = json['count'];
    logo = json['logo'];
    status = json['status'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['prefix'] = this.prefix;
    data['count'] = this.count;
    data['logo'] = this.logo;
    data['status'] = this.status;
    data['userId'] = this.userId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
