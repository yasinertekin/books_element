import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable

/// TextFieldState
final class TextFieldState extends Equatable {
  /// TextFieldState Constructor
  const TextFieldState({
    required this.isObscure,
  });

  /// Is Obscure
  final bool isObscure;

  @override
  List<Object?> get props => [isObscure];

  /// Copy With
  TextFieldState copyWith({
    bool? isObscure,
  }) {
    return TextFieldState(
      isObscure: isObscure ?? this.isObscure,
    );
  }
}
