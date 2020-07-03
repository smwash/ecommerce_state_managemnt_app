import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_concept/providers/product_provider.dart';
import 'package:shop_app_concept/widgets/drawertile.dart';
import 'package:shop_app_concept/widgets/user_product_item.dart';

import '../constants.dart';

class UserProductScreen extends StatelessWidget {
  static const idPage = 'userproductscreen';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'My',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                  color: kPrimaryColor,
                ),
              ),
              TextSpan(
                text: 'Products',
                style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: kPrimaryColor,
            ),
            onPressed: null,
          ),
        ],
      ),
      drawer: DrawerPage(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: ListView.builder(
          itemCount: productData.items.length,
          itemBuilder: (context, index) => UserProductItem(
              title: productData.items[index].title,
              imageUrl: productData.items[index].imageUrl),
        ),
      ),
    );
  }
}
