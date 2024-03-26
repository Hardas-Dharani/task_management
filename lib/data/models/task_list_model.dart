class Country {
  int? id;
  String? code;
  String? name;
  String? createdAt;
  String? updatedAt;

  Country({this.id, this.code, this.name, this.createdAt, this.updatedAt});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class ProjectCover {
  int? id;
  String? url;
  String? fileableType;
  String? tableName;
  int? fileableId;
  String? createdAt;
  String? updatedAt;
  String? fullUrl;
  String? createdAtFormatted;

  ProjectCover(
      {this.id,
      this.url,
      this.fileableType,
      this.tableName,
      this.fileableId,
      this.createdAt,
      this.updatedAt,
      this.fullUrl,
      this.createdAtFormatted});

  ProjectCover.fromJson(Map<String, dynamic> json) {
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

class Role {
  int? id;
  String? name;
  String? title;
  String? createdAt;
  String? updatedAt;

  Role({this.id, this.name, this.title, this.createdAt, this.updatedAt});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['title'] = title;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class TaskListModel {
  List<TaskListModelData>? data;

  TaskListModel({this.data});

  TaskListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TaskListModelData>[];
      json['data'].forEach((v) {
        data!.add(TaskListModelData.fromJson(v));
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

class TaskListModelData {
  int? id;
  String? title;
  String? budget;
  String? startDate;
  String? endDate;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? userId;
  String? skills;
  int? isProgress;
  int? isCompleted;
  int? isDeleted;
  List<ProjectCover>? projectCover;
  List<ProjectCover>? projectFile;
  User? user;

  TaskListModelData(
      {this.id,
      this.title,
      this.budget,
      this.startDate,
      this.endDate,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.userId,
      this.skills,
      this.isProgress,
      this.isCompleted,
      this.isDeleted,
      this.projectCover,
      this.projectFile,
      this.user});

  TaskListModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    budget = json['budget'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
    skills = json['skills'];
    isProgress = json['is_progress'];
    isCompleted = json['is_completed'];
    isDeleted = json['is_deleted'];
    if (json['project_cover'] != null) {
      projectCover = <ProjectCover>[];
      json['project_cover'].forEach((v) {
        projectCover!.add(ProjectCover.fromJson(v));
      });
    }
    if (json['project_file'] != null) {
      projectFile = <ProjectCover>[];
      json['project_file'].forEach((v) {
        projectFile!.add(ProjectCover.fromJson(v));
      });
    }
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['budget'] = budget;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['user_id'] = userId;
    data['skills'] = skills;
    data['is_progress'] = isProgress;
    data['is_completed'] = isCompleted;
    data['is_deleted'] = isDeleted;
    if (projectCover != null) {
      data['project_cover'] = projectCover!.map((v) => v.toJson()).toList();
    }
    if (projectFile != null) {
      data['project_file'] = projectFile!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
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
  Country? country;
  Role? role;
  ProjectCover? image;

  User(
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
      this.image});

  User.fromJson(Map<String, dynamic> json) {
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
    image = json['image'] != null ? ProjectCover.fromJson(json['image']) : null;
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
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}
