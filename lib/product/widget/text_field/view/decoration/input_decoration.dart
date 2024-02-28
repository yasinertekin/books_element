part of '../custom_text_field.dart';

@immutable
final class _InputDecoration extends InputDecoration {
  _InputDecoration(
    String labelText,
    TextInputType textInputType,
    TextFieldCubit textFieldCubit,
  ) : super(
          labelText: labelText,
          suffixIcon: textInputType == TextInputType.visiblePassword
              ? GestureDetector(
                  onTap: () {
                    textFieldCubit.toggleObscure();
                  },
                  child: Icon(
                    textFieldCubit.state.isObscure
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                )
              : null,
        );
}
