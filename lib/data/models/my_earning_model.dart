class Data {
  String? earnings;

  Data({this.earnings});

  Data.fromJson(Map<String, dynamic> json) {
    earnings = json['earnings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['earnings'] = this.earnings;
    return data;
  }
}

class MyEarningModel {
  bool? status;
  int? code;
  String? message;
  Data? data;

  MyEarningModel({this.status, this.code, this.message, this.data});

  MyEarningModel.fromJson(Map<String, dynamic> json) {
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
