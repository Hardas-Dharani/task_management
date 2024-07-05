import 'task_list_model.dart';

class Data {
  List<TaskData>? tasks;

  Data({this.tasks});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['tasks'] != null) {
      tasks = <TaskData>[];
      json['tasks'].forEach((v) {
        tasks!.add(TaskData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tasks != null) {
      data['tasks'] = tasks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuotationModel {
  bool? status;
  int? code;
  String? message;
  Data? data;

  QuotationModel({this.status, this.code, this.message, this.data});

  QuotationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
