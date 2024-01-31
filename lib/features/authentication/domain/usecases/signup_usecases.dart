import 'package:movieapp_cleanarchitrcture/core/exception/authentication/authentication_exception.dart';
import 'package:movieapp_cleanarchitrcture/core/exception/base_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/repositery/auth_repositery.dart';

class SignUsecses {
  final AuthRepositery repositery;
  SignUsecses({required this.repositery});

  Future<void> call(String email, String password) async {
    try {
      repositery.signupAuth(email, password);
    } on BaseException catch (e) {
      throw AuthenticationFailException("cannot signup please try again");
    }
  }
}
