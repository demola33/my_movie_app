import 'package:flutter/foundation.dart';

@immutable
class Genre {
  final String name;
  final String imageUrl;
  final int id;
  final bool isSelected;

  const Genre({
    required this.name,
    required this.imageUrl,
    this.id = 0,
    this.isSelected = false,
  });

  Genre toggleSelected() => Genre(
        name: name,
        imageUrl: imageUrl,
        id: id,
        isSelected: !isSelected,
      );

  @override
  String toString() => 'Genre(name: $name, id: $id, isSelected: $isSelected)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Genre &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.isSelected == isSelected &&
        other.id == id;
  }

  @override
  int get hashCode =>
      name.hashCode ^ imageUrl.hashCode ^ isSelected.hashCode ^ id.hashCode;
}
