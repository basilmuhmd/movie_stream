import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/pages/login_page.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/pages/signup.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'router.g.dart';

final _router = GoRouter(initialLocation: Signup.routePath, routes: [
  GoRoute(
    path: HomePage.routePath,
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: Signup.routePath,
    builder: (context, state) => const Signup(),
  ),
]);

@riverpod
GoRouter router(RouterRef ref) {
  return _router;
}
