import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_concept/providers/product_provider.dart';
import 'package:shop_app_concept/screens/edit_product_screen.dart';

import '../constants.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String id;

  const UserProductItem({Key key, this.id, this.title, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: [kBoxShadow],
      ),
      child: ListTile(
        leading: Image.network(imageUrl),
        title: Text(title),
        trailing: Container(
          width: size.width * 0.25,
          child: Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: kSecondaryColor,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, EditProductScreen.idPage,
                        arguments: id);
                  }),
              IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                  onPressed: () {
                    Provider.of<Products>(context, listen: false)
                        .deleteProduct(id);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
