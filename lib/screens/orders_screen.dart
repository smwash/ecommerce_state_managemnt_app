import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_concept/providers/orders.dart';
import 'package:shop_app_concept/widgets/drawertile.dart';
import 'package:shop_app_concept/widgets/order_item.dart';

import '../constants.dart';

class OrdersScreen extends StatelessWidget {
  static const idPage = 'orders_screen';
  @override
  Widget build(BuildContext context) {
    final orderdata = Provider.of<Orders>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'My',
                style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              TextSpan(
                text: 'Orders',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerPage(),
      body: ListView.builder(
        itemCount: orderdata.orders.length,
        itemBuilder: (context, index) => OrderItemCard(
          order: orderdata.orders[index],
        ),
      ),
    );
  }
}
