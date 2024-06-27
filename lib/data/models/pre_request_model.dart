class Data {
  List<Types>? types;
  List<Teachers>? teachers;

  Data({this.types, this.teachers});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['types'] != null) {
      types = <Types>[];
      json['types'].forEach((v) {
        types!.add(Types.fromJson(v));
      });
    }
    if (json['teachers'] != null) {
      teachers = <Teachers>[];
      json['teachers'].forEach((v) {
        teachers!.add(Teachers.fromJson(v));
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

class Teachers {
  int? id;
  int? roleId;
  bool? selected;
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

  Teachers(
      {this.id,
      this.roleId,
      this.name,
      this.phone,
      this.network,
      this.email,
      this.otp,
      this.newPhone,
      this.selected,
      this.image,
      this.gender,
      this.birthDate,
      this.isPhoneVerified,
      this.isEmailVerified,
      this.status,
      this.language,
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
    selected = false;
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
