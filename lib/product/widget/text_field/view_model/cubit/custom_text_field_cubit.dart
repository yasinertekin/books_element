import 'package:bloc_example/index.dart';

/// CounterCubit
final class TextFieldCubit extends Cubit<TextFieldState> {
  /// CounterCubit Constructor
  TextFieldCubit() : super(const TextFieldState(isObscure: false));

  /// Toggle Obscure
  void toggleObscure() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }
}
