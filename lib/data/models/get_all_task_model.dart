import 'package:task_management/data/models/task_list_model.dart';

class GetAllTaskRequest {
  List<GetAllTaskRequestData>? data;

  GetAllTaskRequest({this.data});

  GetAllTaskRequest.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetAllTaskRequestData>[];
      json['data'].forEach((v) {
        data!.add(GetAllTaskRequestData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllTaskRequestData {
  int? id;
  int? taskId;
  int? teacherId;
  int? status;
  String? createdAt;
  String? updatedAt;
  TaskData? task;

  GetAllTaskRequestData(
      {this.id,
      this.taskId,
      this.teacherId,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.task});

  GetAllTaskRequestData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskId = json['task_id'];
    teacherId = json['teacher_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    task = json['task'] != null ? TaskData.fromJson(json['task']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['task_id'] = taskId;
    data['teacher_id'] = teacherId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (task != null) {
      data['task'] = task!.toJson();
    }
    return data;
  }
}
