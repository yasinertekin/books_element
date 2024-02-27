import 'package:bloc_example/product/widget/text_field/view/custom_text_field.dart';
import 'package:flutter/material.dart';

/// CustomTextFieldMixin
mixin CustomTextFieldMixin on State<CustomTextField> {
  late final TextEditingController _controller;

  /// Controller Getter
  TextEditingController get controller => _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
