class LoginResponseModel {
  bool success;
  int statusCode;
  String code;
  String message;
  Data data;

  LoginResponseModel({
    this.data,
    this.statusCode,
    this.code,
    this.message,
    this.success,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    code = json['code'];
    message = json['message'];
    data = json['data'].length > 0 ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['code'] = this.code;
    data['message'] = this.message;

    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String token;
  int id;
  String email;
  String nickname;
  String firstName;
  String lastName;
  String displayName;

  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.displayName,
    this.email,
    this.nickname,
    this.token,
  });

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    email = json['email'];
    nickname = json['nickname'];
    firstName = json['firstName'];
    lastName = json['secondName'];
    displayName = json['displayName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['id'] = this.id;
    data['email'] = this.email;
    data['nickname'] = this.nickname;
    data['firstName'] = this.firstName;
    data['displayName'] = this.displayName;

    return data;
  }
}
