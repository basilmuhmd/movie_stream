import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp_cleanarchitrcture/core/theme/extensions/apptheme.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/widget/textfield.dart';
import 'package:movieapp_cleanarchitrcture/features/home/data/models/firestore_model.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/comment_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/movie_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/pages/comment_page.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/providers/movie_provider.dart';

class OverviewTop extends ConsumerWidget {
  final MovieEntity entity;
  final String image;
  final String title;
  final String description;
  final String rating;

  const OverviewTop(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.rating,
      required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewController = TextEditingController();
    final space = AppTheme.of(context).spaces;

    return Column(
      children: [
        SizedBox(
          height: space.space_200,
        ),
        Stack(children: [
          Container(
            width: MediaQuery.sizeOf(context).width / 1.2,
            height: space.space_500 * 8,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadiusDirectional.circular(space.space_200 * 2),
              image:
                  DecorationImage(fit: BoxFit.fill, image: NetworkImage(image)),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.fromLTRB(space.space_700 * 5, space.space_200, 0, 0),
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.favorite,
                color: AppTheme.of(context).colors.textSubtlest,
                size: space.space_600,
              ),
            ),
          ),
        ]),
        SizedBox(
          height: space.space_200,
        ),
        InkWell(
          onTap: () {
            ref.read(movieProvider.notifier).createFireStoreCollection(entity);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadiusDirectional.circular(space.space_200 * 2),
              color: AppTheme.of(context).colors.textSubtlest,
            ),
            width: MediaQuery.sizeOf(context).width / 1.2,
            height: space.space_700 * 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTheme.of(context)
                      .typography
                      .h700
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          "Enter your Review",
                          style: AppTheme.of(context).typography.h200,
                        ),
                        content: TextField(
                          controller: reviewController,
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(0),
                                borderSide: BorderSide.none),
                            labelText: "Enter Your Review",
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(movieProvider.notifier)
                                    .addCommentCollection(
                                        CommentEntity(
                                            movieId: "",
                                            text: reviewController.text,
                                            id: entity.id.toString()),
                                        entity.id.toString());
                                context.push(CommentPage.routePath,
                                    extra: entity.id.toString());
                                context.pop();
                              },
                              child: Text("Add Review"))
                        ],
                      ),
                    ),
                child: const Text("Comment")),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Add to favorute",
                  style: AppTheme.of(context).typography.h200,
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 15, 20, 0),
          child: Text(description,
              style: AppTheme.of(context)
                  .typography
                  .h500
                  .copyWith(color: Colors.white)),
        )
      ],
    );
  }
}
