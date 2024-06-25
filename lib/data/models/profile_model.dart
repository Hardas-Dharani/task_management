import 'login_model.dart';

class ProfileModel {
  ProfileModelData? data;

  ProfileModel({this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? ProfileModelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileModelData {
  int? id;
  String? name;
  String? username;
  int? roleId;
  String? email;
  String? phone;
  int? countryId;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? skills;
  String? deletedAt;
  String? college;
  String? aboutMe;
  String? dob;
  String? gender;
  int? isActive;
  String? imageUrl;
  // Country? country;
  // Role? role;
  String? image;

  ProfileModelData(
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
      // this.country,
      // this.role,
      this.image});

  ProfileModelData.fromJson(Map<String, dynamic> json) {
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
    // country =
    //     json['country'] != null ? Country.fromJson(json['country']) : null;
    // role = json['role'] != null ? Role.fromJson(json['role']) : null;
    image = json['image'];
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
    // if (country != null) {
    //   data['country'] = country!.toJson();
    // }
    // if (role != null) {
    //   data['role'] = role!.toJson();
    // }
    data['image'] = image;
    return data;
  }
}
