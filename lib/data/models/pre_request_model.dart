import 'package:task_management/data/models/login_model.dart';

class Data {
  List<Types>? types;
  List<User>? teachers;

  Data({this.types, this.teachers});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    if (json['teachers'] != null) {
      teachers = <User>[];
      json['teachers'].forEach((v) {
        teachers!.add(User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (types != null) {
      data['types'] = types!.map((v) => v.toJson()).toList();
    }
    if (teachers != null) {
      data['teachers'] = teachers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PreRequestModel {
  bool? status;
  int? code;
  String? message;
  Data? data;

  PreRequestModel({this.status, this.code, this.message, this.data});

  PreRequestModel.fromJson(Map<String, dynamic> json) {
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

class Types {
  int? id;
  String? title;
  int? wordCountCompatible;
  int? status;
  String? createdAt;
  String? updatedAt;

  Types(
      {this.id,
      this.title,
      this.wordCountCompatible,
      this.status,
      this.createdAt,
      this.updatedAt});

  Types.fromJson(Map<String, dynamic> json) {
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
