import 'package:bloc_example/product/widget/text_field/view_model/state/text_field_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// CounterCubit
final class TextFieldCubit extends Cubit<TextFieldState> {
  /// CounterCubit Constructor
  TextFieldCubit() : super(const TextFieldState(isObscure: false));

  /// Toggle Obscure
  void toggleObscure() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }
}
