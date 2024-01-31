abstract class AuthenticationDataSourse {
  Future<void> loginAuth(String email, String password);
  Future<void> signupAuth(String email, String password);
  Future<void> verifyEmail();
  Future<void> logOut();
  Future<void> loginWithGoogle();
  Future<void> forgotPassword(String email);
  Future<(String, int?)> sendOtp(String phone);
  Future<void> verifyOtp(String verificationId, String otp);
}
