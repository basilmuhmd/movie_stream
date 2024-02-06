import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp_cleanarchitrcture/core/constents/api_constents/api_constants.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/pages/over_view_movies.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/providers/movie_provider.dart';

class Trendingmovies extends ConsumerWidget {
  const Trendingmovies({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: ref.watch(movieProvider).value!.getPopular.length,
        itemBuilder: (context, itemindex, pageViewIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              onTap: () => context.push(
                OverView.routePath,
                extra: (ref.watch(movieProvider).value!.getPopular[itemindex]),
              ),
              child: Container(
                height: 300,
                width: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(ApiConstants.imagebase +
                            ref
                                .watch(movieProvider)
                                .value!
                                .getPopular[itemindex]
                                .posterPath))),
              ),
            ),
          );
        },
        options: CarouselOptions(
            height: 300,
            autoPlay: true,
            viewportFraction: 0.56,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            enlargeCenterPage: true,
            pageSnapping: true),
      ),
    );
  }
}
