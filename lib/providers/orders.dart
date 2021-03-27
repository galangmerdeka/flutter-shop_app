import 'package:flutter/foundation.dart';

import 'cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final DateTime datetime;
  final List product;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.datetime,
    @required this.product,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProduct, double total) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        datetime: DateTime.now(),
        product: cartProduct,
      ),
    );
    notifyListeners();
  }
}
