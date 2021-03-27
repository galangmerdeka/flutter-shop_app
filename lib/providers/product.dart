import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool isfavorite;

  Product({
    @required this.id,
    @required this.description,
    @required this.title,
    @required this.imageUrl,
    @required this.price,
    this.isfavorite = false,
  });

  void toggleFavorite() {
    isfavorite = !isfavorite;
    notifyListeners();
  }

  favoriteReset() {
    isfavorite = false;
    notifyListeners();
  }
}
