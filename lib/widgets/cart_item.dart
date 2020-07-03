import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_concept/providers/cart.dart';

import '../constants.dart';

class CartItemCard extends StatelessWidget {
  final String id;
  final int quantity;
  final String title;
  final double price;
  final String productId;
  // final String imageUrl;

  const CartItemCard({
    this.id,
    this.quantity,
    this.title,
    this.price,
    this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        margin: EdgeInsets.only(right: 20.0, top: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.0),
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.centerRight,
            colors: [
              kSecondaryColor,
              kPrimaryColor,
              Theme.of(context).errorColor,
            ],
          ),
        ),
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        padding: EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [kBoxShadow],
        ),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: kPrimaryColor, width: 2),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              '\$$price',
              style: kTextStyle,
            ),
          ),
          title: Text(
            title,
            style: kTextStyle,
          ),
          subtitle: Text(
            'Total: \$${(price * quantity)}',
            style: TextStyle(
              fontSize: 14.7,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          trailing: Text(
            '$quantity x',
            style: TextStyle(
              fontSize: 14.7,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
