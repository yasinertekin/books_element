import 'package:bloc_example/product/widget/text_field/view/custom_text_field.dart';
import 'package:bloc_example/product/widget/text_field/view_model/cubit/custom_text_field_cubit.dart';
import 'package:flutter/material.dart';

/// CustomTextFieldMixin
mixin CustomTextFieldMixin on State<CustomTextField> {
  late final TextEditingController _controller;

  /// Controller Getter
  TextEditingController get controller => _controller;

  late final TextFieldCubit _textFieldCubit;

  /// TextField Cubit Getter
  TextFieldCubit get textFieldCubit => _textFieldCubit;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _textFieldCubit = TextFieldCubit();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _textFieldCubit.close();
  }
}
