// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:project_state_mangment/model/handling.dart';

class TaskModel extends ResultModel{
  String taskDescription;
  String taskStatus;
  num project_id;
  TaskModel({
    required this.taskDescription,
    required this.taskStatus,
    required this.project_id,
  });

  TaskModel copyWith({
    String? taskDescription,
    String? taskStatus,
    num? project_id,
  }) {
    return TaskModel(
      taskDescription: taskDescription ?? this.taskDescription,
      taskStatus: taskStatus ?? this.taskStatus,
      project_id: project_id ?? this.project_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taskDescription': taskDescription,
      'taskStatus': taskStatus,
      'project_id': project_id,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      taskDescription: map['taskDescription'] as String,
      taskStatus: map['taskStatus'] as String,
      project_id: map['project_id'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) => TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TaskModel(taskDescription: $taskDescription, taskStatus: $taskStatus, project_id: $project_id)';

  @override
  bool operator ==(covariant TaskModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.taskDescription == taskDescription &&
      other.taskStatus == taskStatus &&
      other.project_id == project_id;
  }

  @override
  int get hashCode => taskDescription.hashCode ^ taskStatus.hashCode ^ project_id.hashCode;
}
