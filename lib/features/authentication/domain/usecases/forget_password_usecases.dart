import 'package:movieapp_cleanarchitrcture/core/exception/authentication/authentication_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/repositery/auth_repositery.dart';

class ForgetPasswordUsecses {
  final AuthRepositery repositery;
  ForgetPasswordUsecses({required this.repositery});

  Future<void> call(String email) async {
    try {
      await repositery.forgotPassword(email);
    } on Exception {
      throw AuthenticationFailException("cannot login please try again");
    }
  }
}
