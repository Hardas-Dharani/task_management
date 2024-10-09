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

class PendingTeacherRequest {
  bool? status;
  int? code;
  String? message;
  Data? data;

  PendingTeacherRequest({this.status, this.code, this.message, this.data});

  PendingTeacherRequest.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? roleId;
  String? name;
  String? phone;
  Null? network;
  String? email;
  Null? otp;
  Null? newPhone;
  Null? image;
  String? gender;
  Null? birthDate;
  int? isPhoneVerified;
  int? isEmailVerified;
  bool? status;
  Null? language;
  String? approvalStatus;
  String? eId;
  String? imageUrl;

  Teachers(
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
      this.approvalStatus,
      this.eId,
      this.imageUrl});

  Teachers.fromJson(Map<String, dynamic> json) {
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
    approvalStatus = json['approval_status'];
    eId = json['e_id'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_id'] = this.roleId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['network'] = this.network;
    data['email'] = this.email;
    data['otp'] = this.otp;
    data['new_phone'] = this.newPhone;
    data['image'] = this.image;
    data['gender'] = this.gender;
    data['birth_date'] = this.birthDate;
    data['is_phone_verified'] = this.isPhoneVerified;
    data['is_email_verified'] = this.isEmailVerified;
    data['status'] = this.status;
    data['language'] = this.language;
    data['approval_status'] = this.approvalStatus;
    data['e_id'] = this.eId;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
