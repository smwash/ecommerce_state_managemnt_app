import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_concept/screens/cart_screen.dart';
import 'package:shop_app_concept/screens/orders_screen.dart';
import 'package:shop_app_concept/screens/user_products_screen.dart';

import './providers/product_provider.dart';
import './screens/products_overview_screen.dart';
import 'providers/cart.dart';
import 'providers/orders.dart';
import 'screens/product_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'I Shop APP',
        theme: ThemeData(fontFamily: 'OpenSans'),
        debugShowCheckedModeBanner: false,
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.idPage: (context) => ProductDetailScreen(),
          CartScreen.idPage: (context) => CartScreen(),
          OrdersScreen.idPage: (context) => OrdersScreen(),
          UserProductScreen.idPage: (context) => UserProductScreen(),
        },
      ),
    );
  }
}
