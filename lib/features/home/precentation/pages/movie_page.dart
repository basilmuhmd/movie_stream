import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp_cleanarchitrcture/core/constents/movie_constents/movie_constends.dart';
import 'package:movieapp_cleanarchitrcture/core/theme/extensions/apptheme.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/providers/auth_provider.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/providers/movie_provider.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/widgets/searchbar.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/widgets/top_rated_movies.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/widgets/trending_movie.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/widgets/upcoming_movies.dart';

class MovieHome extends HookConsumerWidget {
  static const routePath = "/movie-home";
  const MovieHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final space = AppTheme.of(context).spaces;
    final color = AppTheme.of(context).colors;
    final searchController = useTextEditingController();
    final typography = AppTheme.of(context).typography;
    return Scaffold(
        backgroundColor: color.primary,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Cold Star",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {
                ref.read(authenticationProvider(context).notifier).logOut();
              },
              child: const Text("Logout"),
            )
          ],
        ),
        body: ref.watch(movieProvider).isRefreshing
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : switch (ref.watch(movieProvider)) {
                AsyncData() => SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.all(AppTheme.of(context).spaces.space_25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Search(
                              controller: searchController,
                              labelText: MovieConstants.search,
                              textfieldIcon:
                                  const Icon(MovieConstants.searchicon)),
                          Padding(
                            padding: EdgeInsets.all(space.space_100),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  MovieConstants.trending,
                                  style: AppTheme.of(context).typography.h700,
                                ),
                                Text(MovieConstants.seeMore,
                                    style: typography.h400),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: space.space_250,
                          ),
                          const Trendingmovies(),
                          SizedBox(
                            height: space.space_250,
                          ),
                          Padding(
                            padding: EdgeInsets.all(space.space_100),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  MovieConstants.upcoming,
                                  style: typography.h700,
                                ),
                                Text(MovieConstants.seeMore,
                                    style: typography.h400),
                              ],
                            ),
                          ),
                          const SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: Upcoming()),
                          Padding(
                            padding: EdgeInsets.all(space.space_100),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      MovieConstants.toprated,
                                      style: typography.h700,
                                    ),
                                    const Text(MovieConstants.seeMore),
                                  ],
                                ),
                                Text(
                                  MovieConstants.seeMore,
                                  style: typography.h400,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: TopRatedMovies()),
                        ],
                      ),
                    ),
                  ),
                AsyncError(:final error) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'NO DATA, $error',
                          style: typography.pDefault,
                        ),
                        IconButton(
                          onPressed: () {
                            ref.invalidate(movieProvider);
                          },
                          icon: const Icon(Icons.refresh),
                        ),
                      ],
                    ),
                  ),
                _ => const Center(
                    child: CircularProgressIndicator(),
                  ),
              });
  }
}
