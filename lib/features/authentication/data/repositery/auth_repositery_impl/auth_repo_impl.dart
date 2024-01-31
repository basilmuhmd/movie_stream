import 'package:movieapp_cleanarchitrcture/features/authentication/data/dataSourse/firebaseauth_datasourse.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/data/dataSourse/firebaseauth_datasourse_impl.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/repositery/auth_repositery.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_repo_impl.g.dart';

class AuthRepositeryImpl extends AuthRepositery {
  final AuthenticationDataSourse dataSourse;
  AuthRepositeryImpl({required this.dataSourse});

  @override
  Future<void> logOut() async {
    await dataSourse.logOut();
  }

  @override
  Future<void> loginAuth(String email, String password) async {
    await dataSourse.loginAuth(email, password);
  }

  @override
  Future<void> signupAuth(String email, String password) async {
    await dataSourse.signupAuth(email, password);
  }

  @override
  Future<void> verifyEmail() async {
    await dataSourse.verifyEmail();
  }

  @override
  Future<void> loginWithGoogle() async {
    await dataSourse.loginWithGoogle();
  }

  @override
  Future<void> forgotPassword(String email) async {
    await dataSourse.forgotPassword(email);
  }

  @override
  Future<(String, int?)> sendOtp(String phone) async {
    return await dataSourse.sendOtp(phone);
  }

  @override
  Future<void> verifyOtp(String verificationId, String otp) async {
    await dataSourse.verifyOtp(verificationId, otp);
  }
}

@riverpod
AuthRepositery authRepositery(AuthRepositeryRef ref) {
  return AuthRepositeryImpl(
      dataSourse: ref.watch(authenticationDataSourseProvider));
}
