import 'package:bloc_example/product/model/book/books/books.dart';
import 'package:equatable/equatable.dart';

final class BooksState extends Equatable {
  const BooksState({
    this.books,
    this.error,
    this.isLoding = false,
  });

  final Books? books;
  final String? error;
  final bool isLoding;

  BooksState copyWith({
    Books? books,
    String? error,
    bool? isLoding,
  }) =>
      BooksState(
        books: books ?? this.books,
        error: error ?? this.error,
        isLoding: isLoding ?? this.isLoding,
      );

  @override
  List<Object?> get props => [books, error, isLoding];
}
