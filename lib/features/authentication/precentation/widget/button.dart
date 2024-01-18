import 'package:flutter/material.dart';

import 'package:movieapp_cleanarchitrcture/core/theme/extensions/apptheme.dart';

class LoginButton extends StatelessWidget {
  final String? btText;
  final void Function() onTap;
  const LoginButton({super.key, required this.btText, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          backgroundColor: AppTheme.of(context).colors.secondary),
      child: Text(btText!),
    );
  }
}
