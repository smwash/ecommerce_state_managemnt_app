import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_concept/providers/product_provider.dart';

import '../constants.dart';

class ProductDetailScreen extends StatelessWidget {
  static const idPage = 'productdetail_screen';
  final String id;

  const ProductDetailScreen({this.id});
  @override
  Widget build(BuildContext context) {
    final ProductDetailScreen args = ModalRoute.of(context).settings.arguments;
    final productId = args.id;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: loadedProduct.title,
                style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              TextSpan(
                text: ' Detail',
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: size.height,
        child: ListView(
          children: [
            Container(
              height: size.height * 0.45,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [kBoxShadow],
              ),
              child: Hero(
                tag: loadedProduct.imageUrl,
                child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.08),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loadedProduct.description,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Text(
                    'Price: \$${loadedProduct.price}',
                    style: kTextStyle.copyWith(
                      fontSize: 18.0,
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
