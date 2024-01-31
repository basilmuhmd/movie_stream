import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp_cleanarchitrcture/core/constents/assets/app_icons.dart';
import 'package:movieapp_cleanarchitrcture/core/constents/loginContens/login_constens.dart';
import 'package:movieapp_cleanarchitrcture/core/theme/extensions/apptheme.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/pages/phone_login.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/pages/signup.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/providers/auth_provider.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/widget/button.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/widget/google.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/widget/textfield.dart';

class LoginPage extends HookConsumerWidget {
  static const routePath = "/login";
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final space = AppTheme.of(context).spaces;
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: AppTheme.of(context).spaces.space_700 * 2.5,
            ),
            Center(
              child: TextFieldWidget(
                labelText: LoginConstents.mailText,
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
              height: AppTheme.of(context).spaces.space_300,
            ),
            LoginButton(
              btText: LoginConstents.buttontxt,
              onTap: () => ref
                  .read(authenticationProvider(context).notifier)
                  .loginAuth(emailController.text, passwordController.text),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  space.space_200, space.space_400, space.space_200, 0),
              child: Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: space.space_200),
                    child: Text(
                      LoginConstents.or,
                      style: AppTheme.of(context).typography.h600,
                    ),
                  ),
                  const Expanded(child: Divider())
                ],
              ),
            ),
            SizedBox(
              height: space.space_200,
            ),
            InkWell(
              onTap: () => context.push(PhoneLogin.routePath),
              child: Image.asset(
                AppIcon.icPhoneCall,
                height: space.space_400,
                width: space.space_400,
                color: AppTheme.of(context).colors.textSubtlest,
              ),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_600 * 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => ref
                      .read(authenticationProvider(context).notifier)
                      .forgetPassword(emailController.text),
                  child: Text(
                    LoginConstents.forget,
                    style: AppTheme.of(context).typography.h400,
                  ),
                ),
                SizedBox(
                  width: AppTheme.of(context).spaces.space_125,
                ),
                InkWell(
                  onTap: () => context.push(Signup.routePath),
                  child: Text(
                    LoginConstents.signUptxt,
                    style: AppTheme.of(context).typography.h400,
                  ),
                ),
              ],
            ),
            const Google()
          ],
        ),
      ),
    );
  }
}
