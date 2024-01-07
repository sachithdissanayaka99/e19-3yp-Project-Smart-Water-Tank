class sign_request_model {
  String? fullname;
  String? email;
  String? password;

  sign_request_model({this.fullname, this.email, this.password});

  sign_request_model.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}