import 'package:demo_bloc/models/modelApi/user_login.dart';
import 'package:demo_bloc/services/login_service.dart';

import 'login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginService loginService = new LoginService();
  @override
  Future<Token> login(UserLogin userLogin) {
    return loginService.login(userLogin);
  }

  @override
  Future<bool> hasToken() async {
    return true;
  }
}
