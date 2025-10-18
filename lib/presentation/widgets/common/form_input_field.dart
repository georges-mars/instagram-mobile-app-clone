import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';


class FormInputField extends StatelessWidget {
  const FormInputField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.labelText,
    required this.isPasswordField,
  });

  final String hintText, labelText;
  final bool isPasswordField;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 14.0),
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 14.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        fillColor: kTextFieldFillDarkColor,
        filled: true,
        focusColor: kBlueColor,
      ),
      obscureText: isPasswordField,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
