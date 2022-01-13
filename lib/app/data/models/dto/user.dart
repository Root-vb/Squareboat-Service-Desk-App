class User {
  late String name;
  late String id;
  late String email;
  late String access_token;
  late String profilePicture;
  late int organizationId;
  late String status;

  User({
    required this.name,
    required this.id,
    required this.email,
    required this.access_token,
    required this.profilePicture,
    required this.organizationId,
    required this.status,
  });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    email = json['email'];
    access_token = json['access_token'];
    profilePicture = json['profilePicture'];
    organizationId = json['organizationId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['email'] = this.email;
    data['access_token'] = this.access_token;
    data['profilePicture'] = this.profilePicture;
    data['organizationId'] = this.organizationId;
    data['status'] = this.status;
    return data;
  }
}
