import 'login_model.dart';

class GetAllTeacher {
  List<GetAllTeacherData>? data;

  GetAllTeacher({this.data});

  GetAllTeacher.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetAllTeacherData>[];
      json['data'].forEach((v) {
        data!.add(GetAllTeacherData.fromJson(v));
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

class GetAllTeacherData {
  int? id;
  String? name;
  String? username;
  int? roleId;
  String? email;
  String? phone;
  int? countryId;
  Null emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? skills;
  Null deletedAt;
  Null college;
  Null aboutMe;
  Null dob;
  Null gender;
  int? isActive;
  String? imageUrl;
  Country? country;
  Role? role;
  Null reviews;
  Image? image;

  GetAllTeacherData(
      {this.id,
      this.name,
      this.username,
      this.roleId,
      this.email,
      this.phone,
      this.countryId,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.skills,
      this.deletedAt,
      this.college,
      this.aboutMe,
      this.dob,
      this.gender,
      this.isActive,
      this.imageUrl,
      this.country,
      this.role,
      this.reviews,
      this.image});

  GetAllTeacherData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    roleId = json['role_id'];
    email = json['email'];
    phone = json['phone'];
    countryId = json['country_id'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    skills = json['skills'];
    deletedAt = json['deleted_at'];
    college = json['college'];
    aboutMe = json['about_me'];
    dob = json['dob'];
    gender = json['gender'];
    isActive = json['is_active'];
    imageUrl = json['image_url'];
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    reviews = json['reviews'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['role_id'] = roleId;
    data['email'] = email;
    data['phone'] = phone;
    data['country_id'] = countryId;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['skills'] = skills;
    data['deleted_at'] = deletedAt;
    data['college'] = college;
    data['about_me'] = aboutMe;
    data['dob'] = dob;
    data['gender'] = gender;
    data['is_active'] = isActive;
    data['image_url'] = imageUrl;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (role != null) {
      data['role'] = role!.toJson();
    }
    data['reviews'] = reviews;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}

class Image {
  int? id;
  String? url;
  String? fileableType;
  String? tableName;
  int? fileableId;
  String? createdAt;
  String? updatedAt;
  String? fullUrl;
  String? createdAtFormatted;

  Image(
      {this.id,
      this.url,
      this.fileableType,
      this.tableName,
      this.fileableId,
      this.createdAt,
      this.updatedAt,
      this.fullUrl,
      this.createdAtFormatted});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    fileableType = json['fileable_type'];
    tableName = json['table_name'];
    fileableId = json['fileable_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fullUrl = json['full_url'];
    createdAtFormatted = json['created_at_formatted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['fileable_type'] = fileableType;
    data['table_name'] = tableName;
    data['fileable_id'] = fileableId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['full_url'] = fullUrl;
    data['created_at_formatted'] = createdAtFormatted;
    return data;
  }
}
