import 'package:go_router/go_router.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/pages/auth_switcher.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/pages/login_page.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/pages/phone_login.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/pages/signup.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/movie_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/pages/movie_page.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/pages/over_view_movies.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'router.g.dart';

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: AuthSwitcher.routerPath,
      builder: (context, state) => const AuthSwitcher(),
    ),
    GoRoute(
      path: MovieHome.routePath,
      builder: (context, state) => const MovieHome(),
    ),
    GoRoute(
      path: Signup.routePath,
      builder: (context, state) => const Signup(),
    ),
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: OverView.routePath,
      builder: (context, state) => OverView(entity: state.extra as MovieEntity),
    ),
    GoRoute(
      path: PhoneLogin.routePath,
      builder: (context, state) => const PhoneLogin(),
    )
  ],
);

@riverpod
GoRouter router(RouterRef ref) {
  return _router;
}
