import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp_cleanarchitrcture/core/router/router.dart';
import 'package:movieapp_cleanarchitrcture/core/theme/extensions/lighttheme.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MovieApp()));
}

class MovieApp extends ConsumerWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(routerProvider),
      theme: ref.watch(lightThemeProvider),
    );
  }
}
