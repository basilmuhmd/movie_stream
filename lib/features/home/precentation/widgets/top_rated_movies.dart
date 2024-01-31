import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp_cleanarchitrcture/core/constents/api_constents/api_constants.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/providers/movie_provider.dart';

class TopRatedMovies extends ConsumerWidget {
  const TopRatedMovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: ref.watch(movieProvider).value!.getToprated.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 200,
                width: 170,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(ApiConstants.imagebase +
                            ref
                                .watch(movieProvider)
                                .value!
                                .getToprated[index]
                                .posterPath))),
                child: Text(
                    ref.watch(movieProvider).value!.getToprated[index].title),
              ),
            ),
          );
        },
      ),
    );
  }
}
