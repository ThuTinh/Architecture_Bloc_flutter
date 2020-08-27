import 'package:demo_bloc/models/modelApi/user_login.dart';
// import 'package:http/http.dart' as http;
import 'dart:async';

class LoginService {
  Future<Token> login(UserLogin userLogin) async {
    // await http
    //     .post(loginUrl,
    //         headers: <String, String>{
    //           'Content-Type': 'application/json',
    //         },
    //         body: jsonEncode(userLogin.toJson()))
    //     .then((response) {
    //   if (response.statusCode == 200) {
    //     return Token.fromJson(json.decode(response.body));
    //   } else {
    //     print(json.decode(response.body).toString());
    //     throw Exception(json.decode(response.body));
    //   }
    // });
    if (userLogin.password.length > 0 && userLogin.username.length > 0) {
      return Token(token: "token");
    } else {
      print("login errrr");
      throw Exception("login errr catch");
    }
  }
}
