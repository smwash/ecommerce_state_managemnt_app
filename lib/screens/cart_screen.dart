import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_concept/providers/cart.dart';
import 'package:shop_app_concept/providers/orders.dart';
import 'package:shop_app_concept/widgets/cart_item.dart';

import '../constants.dart';

class CartScreen extends StatelessWidget {
  static const idPage = 'cart_screen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }),
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
                text: 'Cart',
                style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.0),
              boxShadow: [kBoxShadow],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Amount',
                  style: kTextStyle,
                ),
                Spacer(),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: kPrimaryColor, width: 2),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    '\$${cart.totalAmount.toStringAsFixed(2)}',
                    style: kTextStyle,
                  ),
                ),
                SizedBox(width: 12.0),
                GestureDetector(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: kDefaultGradient),
                    child: Text(
                      'Check Out',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    Provider.of<Orders>(context, listen: false)
                        .addOrder(cart.items.values.toList(), cart.totalAmount);
                    cart.clear();
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItemCard(
                id: cart.items.values.toList()[i].id,
                productId: cart.items.keys.toList()[i],
                price: cart.items.values.toList()[i].price,
                quantity: cart.items.values.toList()[i].quantity,
                title: cart.items.values.toList()[i].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}
