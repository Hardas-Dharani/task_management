class Data {
  List<Tasks>? tasks;

  Data({this.tasks});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['tasks'] != null) {
      tasks = <Tasks>[];
      json['tasks'].forEach((v) {
        tasks!.add(Tasks.fromJson(v));
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

class Payment {
  int? id;
  int? taskId;
  String? source;
  Null deletedAt;
  String? createdAt;
  String? updatedAt;

  Payment(
      {this.id,
      this.taskId,
      this.source,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskId = json['task_id'];
    source = json['source'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['task_id'] = taskId;
    data['source'] = source;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class PaymentListModel {
  bool? status;
  int? code;
  String? message;
  Data? data;

  PaymentListModel({this.status, this.code, this.message, this.data});

  PaymentListModel.fromJson(Map<String, dynamic> json) {
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

class Tasks {
  int? id;
  int? typeId;
  int? studentId;
  Null teacherId;
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
  Payment? payment;

  Tasks(
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
      this.payment});

  Tasks.fromJson(Map<String, dynamic> json) {
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
    payment =
        json['payment'] != null ? Payment.fromJson(json['payment']) : null;
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
    if (payment != null) {
      data['payment'] = payment!.toJson();
    }
    return data;
  }
}
