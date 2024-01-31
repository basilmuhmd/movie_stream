import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movieapp_cleanarchitrcture/core/theme/extensions/apptheme.dart';

class Search extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final Icon? textfieldIcon;

  const Search(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.textfieldIcon});
  @override
  Widget build(BuildContext context) {
    final space = AppTheme.of(context).spaces;
    return SizedBox(
      height: space.space_700,
      width: space.space_900 * 5.2,
      child: Padding(
        padding: EdgeInsets.fromLTRB(space.space_300, space.space_25, 0, 0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppTheme.of(context).colors.primary,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(space.space_100),
                borderSide: BorderSide.none),
            labelText: labelText,
            suffixIcon: textfieldIcon,
          ),
        ),
      ),
    );
  }
}
