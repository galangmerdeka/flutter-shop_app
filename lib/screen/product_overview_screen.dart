import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screen/cart_screen.dart';
import '../widget/badge.dart';
// import 'package:provider/provider.dart';
import '../widget/product_grid.dart';
import '../widget/main_drawer.dart';
import '../providers/cart.dart';
import '../providers/product.dart';

enum FiltersOption {
  Favorite,
  All,
  Reset,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavorite = false;
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text(
          'Shop App',
          //style: Theme.of(context).textTheme.title,
        ),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FiltersOption selectedValue) {
              setState(() {
                if (selectedValue == FiltersOption.Favorite) {
                  _showOnlyFavorite = true;
                } else if (selectedValue == FiltersOption.All) {
                  _showOnlyFavorite = false;
                } else if (selectedValue == FiltersOption.Reset) {
                  // product.favoriteReset();
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorite'),
                value: FiltersOption.Favorite,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FiltersOption.All,
              ),
              PopupMenuItem(
                child: Text('Reset'),
                value: FiltersOption.Reset,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: ProductsGrid(_showOnlyFavorite),
    );
    return scaffold;
  }
}
