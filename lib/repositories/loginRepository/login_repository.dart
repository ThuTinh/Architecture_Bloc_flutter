import 'package:demo_bloc/models/modelApi/user_login.dart';

abstract class LoginRepository {
  Future<Token> login(UserLogin userLogin);
  Future<bool> hasToken();
}
