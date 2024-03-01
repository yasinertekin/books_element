import 'package:bloc_example/feature/index.dart';

part 'decoration/input_decoration.dart';

/// CustomTextField
final class CustomTextField extends StatefulWidget {
  /// CustomTextField Constructor
  const CustomTextField({
    required this.controller,
    required this.labelText,
    super.key,
    this.validatorText = 'Please enter some text',
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
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
    return BlocBuilder<TextFieldCubit, TextFieldState>(
      bloc: textFieldCubit,
      builder: (context, state) {
        return TextFormField(
          keyboardType: widget.keyboardType,
          obscureText: widget.keyboardType == TextInputType.visiblePassword &&
              !state.isObscure,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          textInputAction: widget.textInputAction,
          validator: _returnValidate,
          controller: controller,
          decoration: _InputDecoration(
            widget.labelText,
            widget.keyboardType,
            textFieldCubit,
          ),
        );
      },
    );
  }

  String? _returnValidate(String? value) {
    if (value == null || value.isEmpty) {
      return widget.validatorText;
    }
    return null;
  }
}