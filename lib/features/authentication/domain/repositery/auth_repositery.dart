

abstract class AuthRepositery{
  Future<void> loginAuth(String email, String password);
  Future<void> signupAuth(String email, String password);
  Future<void> logOut();
}
