import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  bool isFavorite;
  final String description;
  final double price;

  Product(
      {@required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.description,
      @required this.price,
      this.isFavorite = false});

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
