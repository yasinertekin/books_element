import 'package:bloc_example/product/model/book/item/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// A service that provides book data from Firebase.
abstract class IFirebaseBookService {
  /// Returns a list of books.
  Future<List<Item>> getBooks(String userId);

  /// Adds a book to the database.
  Future<void> addBook(Item book, String userId);

  /// Updates a book in the database.
  Future<void> updateBook(Item book, String userId);

  /// Deletes a book from the database.
  Future<void> deleteBook(Item book, String userId);
}

/// A service that provides book data from Firebase.
final class FirebaseBookService implements IFirebaseBookService {
  /// Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addBook(Item book, String userId) async {
    try {
      final bookCollection = _firestore.collection('books').doc(userId);

      // Kullanıcının belgesinin var olup olmadığını kontrol ediyoruz
      final userDocSnapshot = await bookCollection.get();

      // Eğer kullanıcının belgesi yoksa, belgeyi oluşturup kitap listesini ekliyoruz
      if (!userDocSnapshot.exists) {
        await bookCollection
            .set({'book_list': []}); // Sadece bir book_list oluşturuyoruz
      }

      // Kullanıcının book_list alanını güncelleyerek kitabı ekliyoruz
      await bookCollection.update({
        'book_list':
            FieldValue.arrayUnion([book.toJson()]), // Kitabı listeye ekliyoruz
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteBook(Item book, String userId) {
    final bookCollection = _firestore.collection('books').doc(userId);

    return bookCollection.update({
      'book_list': FieldValue.arrayRemove([book.toJson()]),
    });
  }

  @override
  Future<void> updateBook(Item book, String userId) async {
    final bookCollection =
        _firestore.collection('books').doc(userId).collection('userBooks');

    // Check if the document for user exists, if not, return
    final userDocSnapshot =
        await _firestore.collection('books').doc(userId).get();
    if (!userDocSnapshot.exists) {
      return;
    }

    return bookCollection.doc(book.id).update(book.toJson());
  }

  @override
  Future<List<Item>> getBooks(String userId) async {
    final bookCollection = _firestore.collection('books').doc(userId);

    // Check if the document for user exists, if not, return
    final userDocSnapshot =
        await _firestore.collection('books').doc(userId).get();
    if (!userDocSnapshot.exists) {
      return [];
    }

    // Get the book list
    final bookList = userDocSnapshot.data()!['book_list'] as List<dynamic>;

    // Convert the book list to a list of books
// Convert the book list to a list of books
    final books = bookList
        .map((book) => Item.fromJson(book as Map<String, dynamic>))
        .toList();

    return books;
  }
}
