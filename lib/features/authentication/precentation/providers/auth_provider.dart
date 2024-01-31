import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp_cleanarchitrcture/core/exception/base_exception.dart';
import 'package:movieapp_cleanarchitrcture/core/utilities/snakbar_utilities.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/data/repositery/auth_repositery_impl/auth_repo_impl.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/usecases/forget_password_usecases.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/usecases/logi_usecases.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/usecases/login_with_google_usecases.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/usecases/logout_usecases.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/usecases/send_otp_usecase.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/usecases/signup_usecases.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/usecases/verify_email_usecases.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/usecases/verify_otp_usecase.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/pages/login_page.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/providers/auth_state.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/pages/movie_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  @override
  AuthState build(BuildContext context) {
    this.context;

    return AuthState(verificationId: '', resendToken: null);
  }

  Future<void> signupAuth(String email, String password) async {
    try {
      await SignUsecses(repositery: ref.watch(authRepositeryProvider))(
          email, password);
      await verifyEmail();
      Future.sync(() => context.go(MovieHome.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtilities.showMessage(context, e.message));
    }
  }

  Future<void> loginAuth(String email, String password) async {
    try {
      await LoginUsecses(repositery: ref.watch(authRepositeryProvider))(
          email, password);
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtilities.showMessage(context, e.message));
    }
  }

  Future<void> logOut() async {
    try {
      await LogoutUsecses(repositery: ref.watch(authRepositeryProvider))();
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtilities.showMessage(context, e.message));
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      await LoginWithGoogleUsecses(
          repositery: ref.watch(authRepositeryProvider))();
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtilities.showMessage(context, e.message));
    }
  }

  Future<void> verifyEmail() async {
    try {
      await VerifyEmailUsecases(
          repositery: ref.watch(authRepositeryProvider))();
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtilities.showMessage(context, e.message));
    }
  }

  Future<void> forgetPassword(String email) async {
    try {
      await ForgetPasswordUsecses(
          repositery: ref.watch(authRepositeryProvider))(email);
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtilities.showMessage(context, e.message));
    }
  }

  Future<void> sendOtp(BuildContext context, String phone) async {
    try {
      final verificationData = await SendOtpUsecase(
          repositery: ref.watch(authRepositeryProvider))(phone);
      state = AuthState(
          verificationId: verificationData.$1,
          resendToken: verificationData.$2);
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtilities.showMessage(context, e.message));
    }
  }

  Future<void> verifyOtp(BuildContext context, String otp) async {
    try {
      await VerifyOtoUsecase(repositery: ref.watch(authRepositeryProvider))(
          state.verificationId, otp);
      Future.sync(() => context.go(MovieHome.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtilities.showMessage(context, e.message));
    }
  }
}
