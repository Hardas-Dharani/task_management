class CountryModels {
  List<CountryModelData>? data;

  CountryModels({this.data});

  CountryModels.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CountryModelData>[];
      json['data'].forEach((v) {
        data!.add(CountryModelData.fromJson(v));
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

class CountryModelData {
  int? id;
  String? code;
  String? name;
  String? createdAt;
  String? updatedAt;

  CountryModelData(
      {this.id, this.code, this.name, this.createdAt, this.updatedAt});

  CountryModelData.fromJson(Map<String, dynamic> json) {
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
