import 'package:movieapp_cleanarchitrcture/core/exception/authentication/authentication_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/repositery/auth_repositery.dart';

class LoginWithGoogleUsecses {
  final AuthRepositery repositery;
  LoginWithGoogleUsecses({required this.repositery});

  Future<void> call() async {
    try {
      await repositery.loginWithGoogle();
    } on Exception {
      throw AuthenticationFailException("cannot login please try again");
    }
  }
}
