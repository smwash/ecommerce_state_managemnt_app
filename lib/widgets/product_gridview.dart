import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_concept/providers/product_provider.dart';
import '../providers/products_class.dart';
import 'product_card.dart';

class ProductGridView extends StatelessWidget {
  final bool showFavs;

  const ProductGridView({this.showFavs});
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18.0,
        mainAxisSpacing: 18.0,
        childAspectRatio: 2 / 2.6,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        Product product = products[index];
        return ChangeNotifierProvider.value(
          value: product,
          child: ProductCard(
              // id: product.id,
              // title: product.title,
              // imageUrl: product.imageUrl,
              // price: product.price,
              ),
        );
      },
    );
  }
}
