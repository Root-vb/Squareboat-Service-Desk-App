class DeploymentTicket {
  // int? referenceId;
  String? type;
  String? status;
  String? heading;
  String? projectName;
  String? projectManager;
  String? repoName;
  String? branchName;
  String? releasePriority;
  String? releaseNotes;
  String? environment;
  String? participants;
  String? deploymentSteps;

  DeploymentTicket(
      {
      // this.referenceId,
      this.type,
      this.status,
      this.heading,
      this.projectName,
      this.projectManager,
      this.repoName,
      this.branchName,
      this.releasePriority,
      this.releaseNotes,
      this.environment,
      this.participants,
      this.deploymentSteps});

  DeploymentTicket.fromJson(Map<String, dynamic> json) {
    // referenceId = json['referenceId'];
    type = json['type'];
    status = json['status'];
    heading = json['heading'];
    projectName = json['projectName'];
    projectManager = json['projectManager'];
    repoName = json['repoName'];
    branchName = json['branchName'];
    releasePriority = json['releasePriority'];
    releaseNotes = json['releaseNotes'];
    environment = json['environment'];
    participants = json['participants'];
    deploymentSteps = json['deploymentSteps'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['referenceId'] = this.referenceId;
    data['type'] = this.type;
    data['status'] = this.status;
    data['heading'] = this.heading;
    data['projectName'] = this.projectName;
    data['projectManager'] = this.projectManager;
    data['repoName'] = this.repoName;
    data['branchName'] = this.branchName;
    data['releasePriority'] = this.releasePriority;
    data['releaseNotes'] = this.releaseNotes;
    data['environment'] = this.environment;
    data['participants'] = this.participants;
    data['deploymentSteps'] = this.deploymentSteps;
    return data;
  }
}
