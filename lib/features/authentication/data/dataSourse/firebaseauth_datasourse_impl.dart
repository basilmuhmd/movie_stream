import 'package:firebase_auth/firebase_auth.dart';
import 'package:movieapp_cleanarchitrcture/core/exception/authentication/authentication_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/data/dataSourse/firebaseauth_datasourse.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebaseauth_datasourse_impl.g.dart';

class AuthenticationDataSourseImpl implements AuthenticationDataSourse {
  final FirebaseAuth _auth;
  AuthenticationDataSourseImpl(this._auth);

  @override
  Future<UserCredential> loginAuth(String email, String password) async{
   

    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthenticationFailException(
            'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw AuthenticationFailException(
            'The account already exists for this email.');
      } else {
        throw AuthenticationFailException('Cannot signup. Please try again');
      }
    }
   
    

    


  }

  @override
  Future<UserCredential> signupAuth(String email, String password)async {
     try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthenticationFailException(
            'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw AuthenticationFailException(
            'The account already exists for this email.');
      } else {
        throw AuthenticationFailException('Cannot signup. Please try again');
      }
    }
   
  }

  @override
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

@riverpod
AuthenticationDataSourse authenticationDataSourse(
    AuthenticationDataSourseRef ref) {
  return AuthenticationDataSourseImpl(FirebaseAuth.instance);
}
