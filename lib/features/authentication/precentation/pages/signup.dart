import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp_cleanarchitrcture/core/constents/loginContens/login_constens.dart';
import 'package:movieapp_cleanarchitrcture/core/theme/extensions/apptheme.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/pages/login_page.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/providers/auth_provider.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/widget/button.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/widget/textfield.dart';

class Signup extends HookConsumerWidget {
  static const routePath = "/signup";
  const Signup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.secondary,
      body: Column(
        children: [
          SizedBox(
            height: AppTheme.of(context).spaces.space_700 * 2.5,
          ),
          Center(
            child: TextFieldWidget(
              labelText: LoginConstents.userText,
              textfieldIcon: const Icon(Icons.person),
              controller: emailController,
            ),
          ),
          SizedBox(
            height: AppTheme.of(context).spaces.space_300,
          ),
          TextFieldWidget(
            labelText: LoginConstents.passwordText,
            textfieldIcon: const Icon(Icons.password),
            controller: passwordController,
          ),
          SizedBox(
            height: AppTheme.of(context).spaces.space_100,
          ),
          LoginButton(
              btText: LoginConstents.signUptxt,
              onTap: () => ref
                  .read(authenticationProvider(context).notifier)
                  .signupAuth(emailController.text, passwordController.text)),
          SizedBox(
            height: AppTheme.of(context).spaces.space_600 * 6,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LoginConstents.forget,
                style: AppTheme.of(context).typography.h400,
              ),
              SizedBox(
                width: AppTheme.of(context).spaces.space_125,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    LoginConstents.haveAccount,
                    style: AppTheme.of(context).typography.h400,
                  ),
                  InkWell(
                      onTap: () => context.push(HomePage.routePath),
                      child: const Text(LoginConstents.buttontxt))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
