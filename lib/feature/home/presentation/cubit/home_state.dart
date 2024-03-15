import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/model/book/item/item.dart';
import 'package:equatable/equatable.dart';

// Define state for HomeCubit
final class HomeState extends Equatable {
  const HomeState({
    this.favoriteBooks = const [],
    this.isLoading = false,
    this.error,
  });

  final List<Item> favoriteBooks;
  final bool isLoading;
  final Object? error;

  @override
  List<Object?> get props => [favoriteBooks, isLoading, error];

  HomeState copyWith({
    List<Item>? favoriteBooks,
    bool? isLoading,
    Object? error,
  }) {
    return HomeState(
      favoriteBooks: favoriteBooks ?? this.favoriteBooks,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
