import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp_cleanarchitrcture/core/theme/extensions/apptheme.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/providers/auth_provider.dart';

class Google extends ConsumerWidget {
  const Google({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () =>
          ref.read(authenticationProvider(context).notifier).loginWithGoogle(),
      child: SizedBox(
          height: AppTheme.of(context).spaces.space_700,
          width: AppTheme.of(context).spaces.space_700,
          child: Image.network(
              "https://53.fs1.hubspotusercontent-na1.net/hub/53/hubfs/image8-2.jpg?width=893&height=600&name=image8-2.jpg")),
    );
  }
}
