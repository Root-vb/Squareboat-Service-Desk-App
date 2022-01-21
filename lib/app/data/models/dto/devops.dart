class DevopsList {
  List<Devops>? devops;

  DevopsList({
    this.devops,
  });

  DevopsList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      devops = <Devops>[];
      json['data'].forEach((v) {
        devops!.add(new Devops.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.devops != null) {
      data['data'] = this.devops!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class Devops {
  String? id;
  String? name;
  String? profilePicture;
  int? organizationId;
  String? status;
  String? email;

  Devops(
      {this.id,
      this.name,
      this.profilePicture,
      this.organizationId,
      this.status,
      this.email});

  Devops.fromJson(Map<String, dynamic> json) {
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
