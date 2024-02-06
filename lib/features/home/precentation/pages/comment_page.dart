import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/comment_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/domain/enitity/movie_entity.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/providers/movie_provider.dart';
import 'package:movieapp_cleanarchitrcture/features/home/precentation/widgets/comment_listview.dart';

class CommentPage extends ConsumerWidget {
  final String id;
  static const routePath = "/commentPage";
  const CommentPage({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Reviews"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: ref.read(movieProvider.notifier).getCommentCollection(id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CommetListviewWidget(entitycomment: snapshot.data!);
                } else {
                  return const Center(
                    child: Text("No Comments yet"),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
