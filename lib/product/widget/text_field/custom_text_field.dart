import 'package:bloc_example/product/widget/text_field/custom_text_field_mixin.dart';
import 'package:flutter/material.dart';

/// CustomTextField
final class CustomTextField extends StatefulWidget {
  /// CustomTextField Constructor
  const CustomTextField({
    required this.controller,
    super.key,
    this.validatorText = 'Please enter some text',
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.labelText = 'Email',
  });

  /// Controller
  final TextEditingController controller;

  /// Label Text
  final String labelText;

  /// Keyboard Type
  final TextInputType keyboardType;

  /// Text Input Action
  final TextInputAction textInputAction;

  /// Validator Text
  final String validatorText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

final class _CustomTextFieldState extends State<CustomTextField>
    with CustomTextFieldMixin {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      obscureText: widget.keyboardType == TextInputType.visiblePassword,
      scrollPhysics: const NeverScrollableScrollPhysics(),
      textInputAction: widget.textInputAction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.validatorText;
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
      ),
    );
  }
}
