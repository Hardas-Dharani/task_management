class Data {
  List<Revisions>? revisions;

  Data({this.revisions});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['revisions'] != null) {
      revisions = <Revisions>[];
      json['revisions'].forEach((v) {
        revisions!.add(Revisions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (revisions != null) {
      data['revisions'] = revisions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RevisionDetailModel {
  bool? status;
  int? code;
  String? message;
  RevisionDetailModelData? data;

  RevisionDetailModel({this.status, this.code, this.message, this.data});

  RevisionDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null
        ? RevisionDetailModelData.fromJson(json['data'])
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

class RevisionDetailModelData {
  Revisions? revision;

  RevisionDetailModelData({this.revision});

  RevisionDetailModelData.fromJson(Map<String, dynamic> json) {
    revision =
        json['revision'] != null ? Revisions.fromJson(json['revision']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (revision != null) {
      data['revision'] = revision!.toJson();
    }
    return data;
  }
}

class RevisionListModel {
  bool? status;
  int? code;
  String? message;
  Data? data;

  RevisionListModel({this.status, this.code, this.message, this.data});

  RevisionListModel.fromJson(Map<String, dynamic> json) {
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

class Revisions {
  int? id;
  int? taskId;
  int? teacherId;
  int? studentId;
  String? subject;
  String? description;
  String? reply;
  int? approved;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? files;

  Revisions(
      {this.id,
      this.taskId,
      this.teacherId,
      this.studentId,
      this.subject,
      this.description,
      this.reply,
      this.approved,
      this.createdAt,
      this.updatedAt,
      this.files});

  Revisions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taskId = json['task_id'];
    teacherId = json['teacher_id'];
    studentId = json['student_id'];
    subject = json['subject'];
    description = json['description'];
    reply = json['reply'];
    approved = json['approved'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['files'] != null) {
      files = <dynamic>[];
      json['files'].forEach((v) {
        files!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['task_id'] = taskId;
    data['teacher_id'] = teacherId;
    data['student_id'] = studentId;
    data['subject'] = subject;
    data['description'] = description;
    data['reply'] = reply;
    data['approved'] = approved;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (files != null) {
      data['files'] = files!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
