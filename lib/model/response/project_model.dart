// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:project_state_mangment/model/handling.dart';

class ProjectModel extends ResultModel {
String projectName;
String projectDescription;
String projectStatus;
  ProjectModel({
    required this.projectName,
    required this.projectDescription,
    required this.projectStatus,
  });

  ProjectModel copyWith({
    String? projectName,
    String? projectDescription,
    String? projectStatus,
  }) {
    return ProjectModel(
      projectName: projectName ?? this.projectName,
      projectDescription: projectDescription ?? this.projectDescription,
      projectStatus: projectStatus ?? this.projectStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'projectName': projectName,
      'projectDescription': projectDescription,
      'projectStatus': projectStatus,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      projectName: map['projectName'] as String,
      projectDescription: map['projectDescription'] as String,
      projectStatus: map['projectStatus'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) => ProjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProjectModel(projectName: $projectName, projectDescription: $projectDescription, projectStatus: $projectStatus)';

  @override
  bool operator ==(covariant ProjectModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.projectName == projectName &&
      other.projectDescription == projectDescription &&
      other.projectStatus == projectStatus;
  }

  @override
  int get hashCode => projectName.hashCode ^ projectDescription.hashCode ^ projectStatus.hashCode;
}
