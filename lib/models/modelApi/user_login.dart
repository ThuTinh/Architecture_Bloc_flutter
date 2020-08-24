class UserLogin {
  String username;
  String password;
  UserLogin({this.username, this.password});
  Map<String, dynamic> toJson() =>
      {"username": this.username, "password": this.password};
}

class Token {
  String token;
  Token({this.token});
  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(token: json['token']);
  }
}
