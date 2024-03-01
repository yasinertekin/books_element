import 'package:bloc_example/feature/index.dart';
import 'package:bloc_example/product/model/book/item/item.dart';

part 'books.g.dart';

@JsonSerializable()
@immutable
final class Books extends Equatable {
  const Books({
    this.kind,
    this.totalItems,
    this.items,
  });

  factory Books.fromJson(Map<String, dynamic> json) => _$BooksFromJson(json);
  @JsonKey(name: 'kind')
  final String? kind;
  @JsonKey(name: 'totalItems')
  final int? totalItems;
  @JsonKey(name: 'items')
  final List<Item>? items;

  Books copyWith({
    String? kind,
    int? totalItems,
    List<Item>? items,
  }) =>
      Books(
        kind: kind ?? this.kind,
        totalItems: totalItems ?? this.totalItems,
        items: items ?? this.items,
      );

  Map<String, dynamic> toJson() => _$BooksToJson(this);

  @override
  List<Object?> get props => [
        kind,
        totalItems,
        items,
      ];
}
