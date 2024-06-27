import 'package:task_management/data/models/pre_request_model.dart';

class TaskData {
  int? id;
  int? typeId;
  int? studentId;
  int? teacherId;
  String? title;
  String? description;
  String? deadline;
  String? wordCount;
  int? fee;
  String? paymentStatus;
  String? quotationStatus;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? eId;
  Teachers? teacher;
  Type? type;

  TaskData(
      {this.id,
      this.typeId,
      this.studentId,
      this.teacherId,
      this.title,
      this.description,
      this.deadline,
      this.wordCount,
      this.fee,
      this.paymentStatus,
      this.quotationStatus,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.eId,
      this.teacher,
      this.type});

  TaskData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeId = json['type_id'];
    studentId = json['student_id'];
    teacherId = json['teacher_id'];
    title = json['title'];
    description = json['description'];
    deadline = json['deadline'];
    wordCount = json['word_count'];
    fee = json['fee'];
    paymentStatus = json['payment_status'];
    quotationStatus = json['quotation_status'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    eId = json['e_id'];
    teacher = json['teacher'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type_id'] = typeId;
    data['student_id'] = studentId;
    data['teacher_id'] = teacherId;
    data['title'] = title;
    data['description'] = description;
    data['deadline'] = deadline;
    data['word_count'] = wordCount;
    data['fee'] = fee;
    data['payment_status'] = paymentStatus;
    data['quotation_status'] = quotationStatus;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['e_id'] = eId;
    data['teacher'] = teacher;
    if (type != null) {
      data['type'] = type!.toJson();
    }
    return data;
  }
}

class TaskListModel {
  bool? status;
  int? code;
  String? message;
  List<TaskData>? data;

  TaskListModel({this.status, this.code, this.message, this.data});

  TaskListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <TaskData>[];
      json['data'].forEach((v) {
        data!.add(TaskData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Type {
  int? id;
  String? title;
  int? wordCountCompatible;
  int? status;
  String? createdAt;
  String? updatedAt;

  Type(
      {this.id,
      this.title,
      this.wordCountCompatible,
      this.status,
      this.createdAt,
      this.updatedAt});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    wordCountCompatible = json['word_count_compatible'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['word_count_compatible'] = wordCountCompatible;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
