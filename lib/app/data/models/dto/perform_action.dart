class PerformAction {
  String? actionType;
  String? assignedTo;

  PerformAction({
    required this.actionType,
    required this.assignedTo,
  });

  PerformAction.fromJson(Map<String, dynamic> json) {
    actionType = json['actionType'];
    assignedTo = json['assignedTo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['actionType'] = this.actionType;
    data["assignedTo"] = this.assignedTo;

    return data;
  }
}
