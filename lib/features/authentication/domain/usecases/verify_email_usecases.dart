import 'package:movieapp_cleanarchitrcture/core/exception/authentication/authentication_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/repositery/auth_repositery.dart';

class VerifyEmailUsecases {
  final AuthRepositery repositery;
  VerifyEmailUsecases({required this.repositery});

  Future<void> call() async {
    try {
      repositery.verifyEmail();
    } on Exception {
      throw AuthenticationFailException("fail to verify your email");
    }
  }
}
