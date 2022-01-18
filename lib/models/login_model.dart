class LoginModel {
  String token;
  String refreshToken;

  LoginModel({this.token, this.refreshToken});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'refresh_token': refreshToken,
    };
  }
}
