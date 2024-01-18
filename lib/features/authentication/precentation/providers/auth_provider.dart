import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp_cleanarchitrcture/core/exception/base_exception.dart';
import 'package:movieapp_cleanarchitrcture/core/utilities/snakbar_utilities.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/data/repositery/auth_repositery_impl/auth_repo_impl.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/usecases/logi_usecases.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/domain/usecases/signup_usecases.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/pages/login_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  @override
  void build(BuildContext context) {
    this.context;
  }

  Future<void> signupAuth(String email, String password) async {
    try {
      await SignUsecses(repositery: ref.watch(authRepositeryProvider))(
          email, password);
      Future.sync(() => context.go(HomePage.routePath));
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
      await logOut();
    } on BaseException catch (e) {
      Future.sync(() => SnackBarUtilities.showMessage(context, e.message));
    }
  }
}
