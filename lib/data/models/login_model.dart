class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class LoginModel {
  bool? status;
  int? code;
  String? message;
  Data? data;

  LoginModel({this.status, this.code, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
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

class User {
  String? name;
  int? roleId;
  String? phone;
  String? email;
  int? id;
  String? eId;
  String? imageUrl;

  User(
      {this.name,
      this.roleId,
      this.phone,
      this.email,
      this.id,
      this.eId,
      this.imageUrl});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    roleId = json['role_id'];
    phone = json['phone'];
    email = json['email'];
    id = json['id'];
    eId = json['e_id'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['role_id'] = roleId;
    data['phone'] = phone;
    data['email'] = email;
    data['id'] = id;
    data['e_id'] = eId;
    data['image_url'] = imageUrl;
    return data;
  }
}
