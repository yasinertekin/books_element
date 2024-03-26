import 'package:bloc_example/product/model/book/books/books.dart';
import 'package:equatable/equatable.dart';

final class SearchBooksState extends Equatable {
  const SearchBooksState({
    this.books,
    this.error,
    this.isLoding = false,
    this.flutter,
  });

  final Books? books;
  final String? error;
  final bool isLoding;
  final Books? flutter;

  SearchBooksState copyWith({
    Books? books,
    String? error,
    bool? isLoding,
    Books? flutter,
    z,
  }) =>
      SearchBooksState(
        books: books ?? this.books,
        error: error ?? this.error,
        isLoding: isLoding ?? this.isLoding,
        flutter: flutter ?? this.flutter,
      );

  @override
  List<Object?> get props => [books, error, isLoding, flutter];
}
