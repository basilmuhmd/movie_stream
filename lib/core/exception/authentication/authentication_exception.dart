import 'package:movieapp_cleanarchitrcture/core/exception/base_exception.dart';

class AuthenticationFailException extends BaseException {
  AuthenticationFailException(String reason) : super(reason);
}
