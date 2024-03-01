import 'dart:io';

import 'package:bloc_example/product/model/book/books/books.dart';
import 'package:dio/dio.dart';

/// Service to fetch books from the Google Books API
abstract class BookService {
  /// Fetch books from the Google Books API
  BookService({required this.service});

  /// Fetch books from the Google Books API
  Future<Books> getBooks(String query);

  /// The Dio service
  final Dio service;
}

/// Implementation of [BookService]
final class BookServiceImpl extends BookService {
  /// Implementation of [BookService]
  BookServiceImpl({required super.service});

  @override
  Future<Books> getBooks(String query) async {
    final response = await service.get<Map<String, dynamic>>(
      query,
    );
    if (response.statusCode == HttpStatus.ok) {
      final responseData = response.data!;
      return Books.fromJson(responseData);
    } else {
      throw Exception('Failed to load books');
    }
  }
}

/// The service URL
enum ServiceUrl {
  /// The service URL
  baseUrl('https://www.googleapis.com/books/v1/volumes?q=');

  const ServiceUrl(this.value);

  /// The service URL
  final String value;
}
