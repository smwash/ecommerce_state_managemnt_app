import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_concept/constants.dart';
import 'package:shop_app_concept/providers/cart.dart';
import 'package:shop_app_concept/providers/products_class.dart';
import 'package:shop_app_concept/widgets/badge.dart';
import 'package:shop_app_concept/widgets/drawertile.dart';

import '../widgets/product_gridview.dart';
import 'cart_screen.dart';

enum FilterOption {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavoritesOnly = false;
  final List<Product> loadedProducts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'I',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                  color: kPrimaryColor,
                ),
              ),
              TextSpan(
                text: 'Shop',
                style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          PopupMenuButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            onSelected: (FilterOption values) {
              setState(() {
                if (values == FilterOption.Favorites) {
                  _showFavoritesOnly = true;
                } else {
                  _showFavoritesOnly = false;
                }
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Show Favorites'),
                value: FilterOption.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterOption.All,
              ),
            ],
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
          ),
          Consumer<Cart>(
            builder: (context, cart, child) => Badge(
              child: child,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.idPage);
                }),
          ),
        ],
      ),
      drawer: DrawerPage(),
      body: ProductGridView(showFavs: _showFavoritesOnly),
    );
  }
}
