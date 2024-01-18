import 'package:movieapp_cleanarchitrcture/core/exception/authentication/authentication_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/repositery/auth_repositery.dart';

class LogoutUsecses {
  final AuthRepositery repositery;
  LogoutUsecses({required this.repositery});

  Future<void> call(String email, String password) async {
    try {
      repositery.logOut();
    } on Exception {
      throw AuthenticationFailException("cannot Signup please try again");
    }
  }
}
