import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/providers/movie_provider.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/widgets/gridview_fav.dart';

class FavoritePage extends ConsumerWidget {
  static const routePath = "/favoritePage";
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder(
            stream: ref.read(movieProvider.notifier).getCollection(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridViewFav(entity: snapshot.data!);
              } else {
                return const Text("No fav found");
              }
            },
          )
        ],
      ),
    );
  }
}
