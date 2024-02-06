import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp_cleanarchitrcture/core/constents/api_constents/api_constants.dart';
import 'package:movieapp_cleanarchitrcture/core/theme/extensions/apptheme.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/comment_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/movie_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/pages/favorite_page.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/widgets/top_part_overview.dart';

class OverView extends ConsumerWidget {
  static const routePath = "/overview";
  final MovieEntity entity;

  const OverView({
    super.key,
    required this.entity,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = AppTheme.of(context).colors;
    return Scaffold(
      backgroundColor: color.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        // title: Text("Details"),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: AppTheme.of(context).spaces.space_600,
              height: AppTheme.of(context).spaces.space_600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppTheme.of(context).colors.textSubtle,
              ),
              child: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.chevron_left,
                ),
                color: color.secondary,
              ),
            ),
            const Text("Details"),
            Container(
              width: AppTheme.of(context).spaces.space_600,
              height: AppTheme.of(context).spaces.space_600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppTheme.of(context).colors.textSubtle,
              ),
              child: InkWell(
                onTap: () => context.push(FavoritePage.routePath),
                child: Icon(
                  Icons.share,
                  color: color.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OverviewTop(
              image: ApiConstants.imagebase + entity.posterPath,
              title: entity.originalTitle,
              description: entity.overview,
              rating: entity.voteAverage.toString(),
              entity: entity,
            )
          ],
        ),
      ),
    );
  }
}
