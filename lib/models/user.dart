class User {
  String email;
  String token;

  User({this.email, this.token});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(email: json['email'], token: json['token']);
  }
}
