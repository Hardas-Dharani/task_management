class Student {
  int? id;
  int? roleId;
  String? name;
  String? phone;
  Null network;
  String? email;
  Null otp;
  Null newPhone;
  Null image;
  String? gender;
  Null birthDate;
  int? isPhoneVerified;
  int? isEmailVerified;
  bool? status;
  Null language;
  String? eId;
  String? imageUrl;

  Student(
      {this.id,
      this.roleId,
      this.name,
      this.phone,
      this.network,
      this.email,
      this.otp,
      this.newPhone,
      this.image,
      this.gender,
      this.birthDate,
      this.isPhoneVerified,
      this.isEmailVerified,
      this.status,
      this.language,
      this.eId,
      this.imageUrl});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleId = json['role_id'];
    name = json['name'];
    phone = json['phone'];
    network = json['network'];
    email = json['email'];
    otp = json['otp'];
    newPhone = json['new_phone'];
    image = json['image'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    isPhoneVerified = json['is_phone_verified'];
    isEmailVerified = json['is_email_verified'];
    status = json['status'];
    language = json['language'];
    eId = json['e_id'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['role_id'] = roleId;
    data['name'] = name;
    data['phone'] = phone;
    data['network'] = network;
    data['email'] = email;
    data['otp'] = otp;
    data['new_phone'] = newPhone;
    data['image'] = image;
    data['gender'] = gender;
    data['birth_date'] = birthDate;
    data['is_phone_verified'] = isPhoneVerified;
    data['is_email_verified'] = isEmailVerified;
    data['status'] = status;
    data['language'] = language;
    data['e_id'] = eId;
    data['image_url'] = imageUrl;
    return data;
  }
}

class Task {
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
  Student? student;
  Student? teacher;
  List<dynamic>? files;

  Task(
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
      this.student,
      this.teacher,
      this.files});

  Task.fromJson(Map<String, dynamic> json) {
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
    student =
        json['student'] != null ? Student.fromJson(json['student']) : null;
    teacher =
        json['teacher'] != null ? Student.fromJson(json['teacher']) : null;
    if (json['files'] != null) {
      files = <Null>[];
      json['files'].forEach((v) {
        files!.add(v);
      });
    }
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
    if (student != null) {
      data['student'] = student!.toJson();
    }
    if (teacher != null) {
      data['teacher'] = teacher!.toJson();
    }
    if (files != null) {
      data['files'] = files!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TaskDetailModel {
  bool? status;
  int? code;
  String? message;
  TaskDetailModelData? data;

  TaskDetailModel({this.status, this.code, this.message, this.data});

  TaskDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? TaskDetailModelData.fromJson(json['data'])
        : null;
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

class TaskDetailModelData {
  Task? task;

  TaskDetailModelData({this.task});

  TaskDetailModelData.fromJson(Map<String, dynamic> json) {
    task = json['task'] != null ? Task.fromJson(json['task']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (task != null) {
      data['task'] = task!.toJson();
    }
    return data;
  }
}
