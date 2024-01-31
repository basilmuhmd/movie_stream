import 'package:movieapp_cleanarchitrcture/core/exception/base_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/repositery/auth_repositery.dart';

class SendOtpUsecase {
  final AuthRepositery repositery;
  SendOtpUsecase({required this.repositery});

  Future<(String, int?)> call(String phone) async {
    if (phone.trim().isEmpty) {
      throw BaseException("invalid phone number");
    }
    try {
      return await repositery.sendOtp(phone);
    } on Exception {
      throw BaseException('Enter your phone number correctly');
    }
  }
}
