import 'package:movieapp_cleanarchitrcture/core/exception/authentication/authentication_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/repositery/auth_repositery.dart';

class SignUsecses {
  final AuthRepositery repositery;
  SignUsecses({required this.repositery});

  Future<void> call(String email, String password) async {
    try {
      repositery.signupAuth(email, password);
    } on Exception {
      throw AuthenticationFailException("cannot login please try again");
    }
  }
}
