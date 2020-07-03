import 'package:flutter/material.dart';
import 'package:shop_app_concept/constants.dart';
import 'package:shop_app_concept/screens/orders_screen.dart';
import 'package:shop_app_concept/screens/products_overview_screen.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(gradient: kDefaultGradient),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    'JD',
                    style: TextStyle(color: Colors.deepOrange),
                  ),
                ),
                Text(
                  'John Doe',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'stest#gmail.com',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text(
              'Shop',
              style: kTextStyle,
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsOverviewScreen(),
                ),
              );
            },
          ),
          Divider(color: kPrimaryColor, thickness: 1),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('My Orders', style: kTextStyle),
            onTap: () {
              Navigator.pushReplacementNamed(context, OrdersScreen.idPage);
            },
          ),
        ],
      ),
    );
  }
}
