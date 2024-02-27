part of '../custom_text_field.dart';

@immutable
final class _InputDecoration extends InputDecoration {
  _InputDecoration(
    String labelText,
    TextInputType textInputType,
    BuildContext context,
  ) : super(
          labelText: labelText,
          suffixIcon: textInputType == TextInputType.visiblePassword
              ? IconButton(
                  onPressed: () {
                    context.read<TextFieldCubit>().toggleObscure();
                  },
                  icon: Icon(
                    context.read<TextFieldCubit>().state.isObscure
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                )
              : null,
        );
}
