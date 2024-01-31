import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp_cleanarchitrcture/core/theme/extensions/apptheme.dart';

class OverviewTop extends ConsumerWidget {
  final String image;
  final String title;
  final String description;
  final String rating;

  const OverviewTop(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.rating});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final space = AppTheme.of(context).spaces;

    return Column(
      children: [
        SizedBox(
          height: space.space_200,
        ),
        Stack(children: [
          Container(
            width: MediaQuery.sizeOf(context).width / 1.2,
            height: space.space_500 * 10,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadiusDirectional.circular(space.space_200 * 2),
              image:
                  DecorationImage(fit: BoxFit.fill, image: NetworkImage(image)),
            ),
          ),
        ]),
        SizedBox(
          height: space.space_200,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(space.space_200 * 2),
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
