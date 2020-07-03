import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app_concept/providers/orders.dart';

import '../constants.dart';

class OrderItemCard extends StatefulWidget {
  final OrderItem order;

  const OrderItemCard({this.order});

  @override
  _OrderItemCardState createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  var _isextended = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14.0),
              boxShadow: [kBoxShadow],
            ),
            child: ListTile(
              title: Text(
                '\$${widget.order.amount}',
                style: kTextStyle.copyWith(letterSpacing: 1.1, fontSize: 16.0),
              ),
              // title: Text(order.),
              subtitle: Text(
                DateFormat('dd/mm/yyyy  hh:mm')
                    .format(widget.order.dateTime)
                    .toString(),
                style:
                    kTextStyle.copyWith(fontSize: 14.9, color: Colors.black54),
              ),
              trailing: IconButton(
                icon: Icon(_isextended ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _isextended = !_isextended;
                  });
                },
              ),
            ),
          ),
          if (_isextended)
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.0),
                boxShadow: [kBoxShadow],
              ),
              height: min(
                  widget.order.products.length * size.height * 0.05 +
                      size.height * 0.01,
                  size.height * 0.24),
              child: ListView(
                children: widget.order.products
                    .map(
                      (product) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.title,
                            style: kTextStyle,
                          ),
                          Text('${product.price}x \$${product.quantity}',
                              style: kTextStyle),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
