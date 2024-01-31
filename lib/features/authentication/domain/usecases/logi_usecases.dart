import 'package:movieapp_cleanarchitrcture/core/exception/authentication/authentication_exception.dart';
import 'package:movieapp_cleanarchitrcture/core/exception/base_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/repositery/auth_repositery.dart';

class LoginUsecses {
  final AuthRepositery repositery;
  LoginUsecses({required this.repositery});

  Future<void> call(String email, String password) async {
    try {
      await repositery.loginAuth(email, password);
    } on BaseException catch (e) {
      throw AuthenticationFailException(e.message);
    }
  }
}
