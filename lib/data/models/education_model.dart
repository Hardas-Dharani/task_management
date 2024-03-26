import 'package:task_management/data/models/login_model.dart';

class EducationModelData {
  int? id;
  String? schoolName;
  String? degree;
  String? areaStudy;
  String? startDate;
  String? endDate;
  int? userId;
  String? createdAt;
  String? updatedAt;
  UserModel? user;

  EducationModelData(
      {this.id,
      this.schoolName,
      this.degree,
      this.areaStudy,
      this.startDate,
      this.endDate,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.user});

  EducationModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolName = json['school_name'];
    degree = json['degree'];
    areaStudy = json['area_study'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['school_name'] = schoolName;
    data['degree'] = degree;
    data['area_study'] = areaStudy;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class EducationModel {
  List<EducationModelData>? data;

  EducationModel({this.data});

  EducationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <EducationModelData>[];
      json['data'].forEach((v) {
        data!.add(EducationModelData.fromJson(v));
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
