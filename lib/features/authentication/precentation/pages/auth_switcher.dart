import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/pages/login_page.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/pages/movie_page.dart';

class AuthSwitcher extends StatelessWidget {
  const AuthSwitcher({super.key});
  static const routerPath = '/';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const LoginPage();
        } else {
          return const MovieHome();
        }
      },
    );
  }
}
