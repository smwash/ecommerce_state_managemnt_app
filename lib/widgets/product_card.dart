import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_concept/constants.dart';
import 'package:shop_app_concept/providers/cart.dart';
import 'package:shop_app_concept/providers/products_class.dart';
import 'package:shop_app_concept/screens/product_detail_screen.dart';

class ProductCard extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;
  // final double price;

  // const ProductCard({this.id, this.title, this.imageUrl, this.price});
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13.0),
        boxShadow: [kBoxShadow],
      ),
      child: Column(
        children: [
          GestureDetector(
            child: Hero(
              tag: product.imageUrl,
              child: Container(
                height: size.height * 0.18,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    (13.0),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      product.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                ProductDetailScreen.idPage,
                arguments: (ProductDetailScreen(
                  id: product.id,
                )),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 5.0, right: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: TextStyle(fontSize: 17.5, fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: product.price.toString(),
                            style: TextStyle(
                              fontSize: 16.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: '/each',
                            style: TextStyle(color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Consumer<Product>(
                          builder: (context, product, _) => InkWell(
                            child: Container(
                              padding: EdgeInsets.all(7.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Icon(
                                  product.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: kPrimaryColor),
                            ),
                            onTap: () {
                              product.toggleFavoriteStatus();
                            },
                          ),
                        ),
                        SizedBox(width: 10.0),
                        InkWell(
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              gradient: kDefaultGradient,
                            ),
                            child: Icon(Icons.add_shopping_cart,
                                color: Colors.white),
                          ),
                          onTap: () {
                            cart.addItem(
                              product.id,
                              product.price,
                              product.title,
                              // product.imageUrl,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
