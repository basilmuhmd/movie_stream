import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp_cleanarchitrcture/core/constents/api_constents/api_constants.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/movie_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/pages/over_view_movies.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/providers/movie_provider.dart';

class GridViewFav extends ConsumerWidget {
  final List<MovieEntity> entity;
  const GridViewFav({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 300,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: entity.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                InkWell(
                  onTap: () => context.push(OverView.routePath),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: NetworkImage(
                            ApiConstants.imagebase + entity[index].posterPath),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: FloatingActionButton.small(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        ref
                            .read(movieProvider.notifier)
                            .deleteFirStoreCollection(
                                entity[index].id.toString());
                      },
                      child: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    )),
              ],
            );
          },
        ),
      ),
    );
  }
}
