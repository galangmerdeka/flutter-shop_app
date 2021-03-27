import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screen/cart_screen.dart';

import './screen/product_overview_screen.dart';
import 'providers/products.dart';
import './screen/product_detail_screen.dart';
import './providers/cart.dart';
import './providers/orders.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // create: (ctx) => ProvProducts(),
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Products(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'SHOP APP',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(153, 204, 255, 1),
          canvasColor: Colors.white,
          fontFamily: 'OpenSans',
          accentColor: Colors.deepOrange,
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                body1: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                body2: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                display1: TextStyle(
                  fontSize: 16,
                ),
              ),
        ),
        home: Scaffold(
          body: ProductOverviewScreen(),
        ),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
