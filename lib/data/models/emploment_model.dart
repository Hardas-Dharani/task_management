import 'package:task_management/data/models/country_model.dart';
import 'package:task_management/data/models/login_model.dart';

class EmploymentModel {
  List<EmploymentModelData>? data;

  EmploymentModel({this.data});

  EmploymentModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <EmploymentModelData>[];
      json['data'].forEach((v) {
        data!.add(EmploymentModelData.fromJson(v));
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

class EmploymentModelData {
  int? id;
  String? companyName;
  String? designation;
  String? city;
  int? countryId;
  int? userId;
  String? startDate;
  String? endDate;
  String? description;
  int? isWorking;
  String? createdAt;
  String? updatedAt;
  UserModel? user;
  CountryModels? country;

  EmploymentModelData(
      {this.id,
      this.companyName,
      this.designation,
      this.city,
      this.countryId,
      this.userId,
      this.startDate,
      this.endDate,
      this.description,
      this.isWorking,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.country});

  EmploymentModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyName = json['company_name'];
    designation = json['designation'];
    city = json['city'];
    countryId = json['country_id'];
    userId = json['user_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    description = json['description'];
    isWorking = json['is_working'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    country = json['country'] != null
        ? CountryModels.fromJson(json['country'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_name'] = companyName;
    data['designation'] = designation;
    data['city'] = city;
    data['country_id'] = countryId;
    data['user_id'] = userId;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['description'] = description;
    data['is_working'] = isWorking;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (country != null) {
      data['country'] = country!.toJson();
    }
    return data;
  }
}
