import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movieapp_cleanarchitrcture/core/exception/authentication/authentication_exception.dart';
import 'package:movieapp_cleanarchitrcture/core/exception/base_exception.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/data/dataSourse/firebaseauth_datasourse.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebaseauth_datasourse_impl.g.dart';

class AuthenticationDataSourseImpl implements AuthenticationDataSourse {
  final FirebaseAuth _auth;
  AuthenticationDataSourseImpl(this._auth);

  @override
  Future<UserCredential> loginAuth(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthenticationFailException('The password provided is too weak.');
      } else {
        throw AuthenticationFailException("${e.message}");
      }
    }
  }

  @override
  Future<UserCredential> signupAuth(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthenticationFailException('The password provided is too weak.');
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

  @override
  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();
  }

  @override
  Future<UserCredential> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> forgotPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<(String, int?)> sendOtp(String phone, [int? resendTocken]) async {
    try {
      final verificationIdCompleter = Completer<String>();
      final resendTockenCompleter = Completer<int?>();

      await FirebaseAuth.instance.verifyPhoneNumber(
        forceResendingToken: resendTocken,
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == "invalid phone number") {}
        },
        codeSent: (String? verificationId, int? resendTocken) async {
          verificationIdCompleter.complete(verificationId);
          resendTockenCompleter.complete(resendTocken);
        },
        codeAutoRetrievalTimeout: (String verificationId) async {},
      );
      final verificationId = await verificationIdCompleter.future;
      final newResendToken = await resendTockenCompleter.future;

      return (verificationId, newResendToken);
    } on Exception {
      throw BaseException("cant login,please try again latter");
    }
  }

  @override
  Future<void> verifyOtp(String verificationId, String otp) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    await _auth.signInWithCredential(credential);
  }
}

@riverpod
AuthenticationDataSourse authenticationDataSourse(
    AuthenticationDataSourseRef ref) {
  return AuthenticationDataSourseImpl(FirebaseAuth.instance);
}
