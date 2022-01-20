class CreateComments {
  String? description;

  CreateComments({required this.description});

  CreateComments.fromJson(Map<String, dynamic> json) {
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['description'] = this.description;

    return data;
  }
}
