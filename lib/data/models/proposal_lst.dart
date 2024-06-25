import 'task_list_model.dart';

class GetListPropsalModel {
  List<GetListPropsalModelData>? data;

  GetListPropsalModel({this.data});

  GetListPropsalModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetListPropsalModelData>[];
      json['data'].forEach((v) {
        data!.add(GetListPropsalModelData.fromJson(v));
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

class GetListPropsalModelData {
  int? id;
  String? duration;
  String? amount;
  String? cover;
  int? userId;
  int? taskId;
  String? createdAt;
  String? updatedAt;
  int? status;
  User? user;
  TaskListModelData? task;
  List<ProjectCover>? proposalImages;

  GetListPropsalModelData(
      {this.id,
      this.duration,
      this.amount,
      this.cover,
      this.userId,
      this.taskId,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.user,
      this.task,
      this.proposalImages});

  GetListPropsalModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    duration = json['duration'];
    amount = json['amount'];
    cover = json['cover'];
    userId = json['user_id'];
    taskId = json['task_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    task =
        json['task'] != null ? TaskListModelData.fromJson(json['task']) : null;
    if (json['proposal_images'] != null) {
      proposalImages = <ProjectCover>[];
      json['proposal_images'].forEach((v) {
        proposalImages!.add(ProjectCover.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['duration'] = duration;
    data['amount'] = amount;
    data['cover'] = cover;
    data['user_id'] = userId;
    data['task_id'] = taskId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (task != null) {
      data['task'] = task!.toJson();
    }
    if (proposalImages != null) {
      data['proposal_images'] = proposalImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
