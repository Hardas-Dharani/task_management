import 'package:task_management/data/models/task_detail_model.dart';

class Data {
  List<Teachers>? teachers;

  Data({this.teachers});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['teachers'] != null) {
      teachers = <Teachers>[];
      json['teachers'].forEach((v) {
        teachers!.add(new Teachers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teachers != null) {
      data['teachers'] = this.teachers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EarningTeacherData {
  bool? status;
  int? code;
  String? message;
  Data? data;

  EarningTeacherData({this.status, this.code, this.message, this.data});

  EarningTeacherData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Teachers {
  Student? teacher;
  String? totalEarnings;
  String? netEarnings;

  Teachers({this.teacher, this.totalEarnings, this.netEarnings});

  Teachers.fromJson(Map<String, dynamic> json) {
    teacher =
        json['teacher'] != null ? new Student.fromJson(json['teacher']) : null;
    totalEarnings = json['total_earnings'];
    netEarnings = json['net_earnings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teacher != null) {
      data['teacher'] = this.teacher!.toJson();
    }
    data['total_earnings'] = this.totalEarnings;
    data['net_earnings'] = this.netEarnings;
    return data;
  }
}
