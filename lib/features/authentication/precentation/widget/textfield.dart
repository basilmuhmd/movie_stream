import 'package:flutter/material.dart';
import 'package:movieapp_cleanarchitrcture/core/theme/extensions/apptheme.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final Icon? textfieldIcon;
  final bool? isEnabled;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.textfieldIcon,
    this.isEnabled,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppTheme.of(context).spaces.space_800,
      width: AppTheme.of(context).spaces.space_900 * 5.2,
      child: TextField(
        controller: controller,
        enabled: isEnabled,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
              borderSide: BorderSide.none),
          labelText: labelText,
          suffixIcon: textfieldIcon,
        ),
      ),
    );
  }
}
