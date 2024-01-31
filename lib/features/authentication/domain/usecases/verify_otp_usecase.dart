import 'package:movieapp_cleanarchitrcture/core/exception/base_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/repositery/auth_repositery.dart';

class VerifyOtoUsecase {
  final AuthRepositery repositery;

  VerifyOtoUsecase({required this.repositery});

  Future<void> call(String verificationId, String otp) async {
    if (otp.trim().isEmpty) {
      throw BaseException("please enter otp");
    }
    try {
      await repositery.verifyOtp(verificationId, otp);
    } on Exception {
      throw BaseException("wrong otp");
    }
  }
}
