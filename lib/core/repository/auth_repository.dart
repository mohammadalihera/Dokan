import 'package:product_show_case/core/dao/auth_dao.dart';
import 'package:product_show_case/core/model/registration/registration_data.dart';
import 'package:product_show_case/core/model/registration/registration_response.dart';

class AuthRepository {
  AuthDAO _authDAO = AuthDAO();

  Future<RegistrationData?> registration({
    required String name,
    required String email,
    required String password,
  }) async {
    return await _authDAO.registration(name: name, email: email, password: password);
  }
}
