import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product_detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);

    // final product = Provider.of<Products>(context);
    final appBar = AppBar(
      title: Text(loadedProduct.title),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  0.4,
              width: double.infinity,
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    loadedProduct.title,
                    style: Theme.of(context).textTheme.body1,
                  ),
                  // Icon(Icons.favorite
                  //     ),
                ],
              ),
            ),
            Container(
              // height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Description',
                      style: Theme.of(context).textTheme.title,
                    ),
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.1,
                    width: double.infinity,
                    // decoration: BoxDecoration(
                    //   color: Colors.white,
                    //   border: Border.all(color: Colors.grey),
                    //   borderRadius: BorderRadius.circular(15),
                    // ),
                    padding: EdgeInsets.all(10),
                    child: Text(
                      loadedProduct.description,
                      style: Theme.of(context).textTheme.body2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
