import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movieapp_cleanarchitrcture/core/constents/loginContens/login_constens.dart';
import 'package:movieapp_cleanarchitrcture/core/theme/extensions/app_colorplette.dart';
import 'package:movieapp_cleanarchitrcture/core/theme/extensions/apptheme.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/providers/auth_provider.dart';
import 'package:movieapp_cleanarchitrcture/features/authentication/precentation/widget/textfield.dart';

class PhoneLogin extends HookConsumerWidget {
  static const routePath = "/phonePage";
  const PhoneLogin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final phoneController = useTextEditingController();
    final otpController = useTextEditingController();
    final color = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;

    /// Is OTP text field enabled
    final isOtpEnabled = useState<bool>(false);

    return Scaffold(
      backgroundColor: color.primary,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            space.space_200, space.space_200, space.space_200, 0),
        child: Column(
          children: [
            SizedBox(
              height: space.space_900 * 3,
            ),
            TextFieldWidget(
                controller: phoneController,
                labelText: LoginConstents.mobileText,
                textfieldIcon: const Icon(Icons.call)),
            SizedBox(
              height: space.space_250,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFieldWidget(
                      controller: otpController,
                      isEnabled: isOtpEnabled.value,
                      labelText: LoginConstents.enterOtp,
                      textfieldIcon: null),
                ),
                ElevatedButton(
                  onPressed: () {
                    ref
                        .read(authenticationProvider(context).notifier)
                        .sendOtp(context, phoneController.text);
                    isOtpEnabled.value = true;
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                      backgroundColor: AppColorPalette.whitePure,
                      minimumSize: Size(0, space.space_800)),
                  child: const Text(
                    LoginConstents.sendOtp,
                  ),
                )
              ],
            ),
            TextButton(
                onPressed: () => ref
                    .read(AuthenticationProvider(context).notifier)
                    .verifyOtp(context, otpController.text),
                child: const Text(LoginConstents.buttontxt)),
          ],
        ),
      ),
    );
  }
}
