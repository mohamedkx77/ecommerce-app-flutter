import 'package:boltecommerce/providers/productProviders.dart';
import 'package:boltecommerce/widget/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeaturedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProviders>(context);
    final products = productData.items;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: products[index],
          child: ProductItem(),
        ),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 177,
          childAspectRatio: 3 / 4.4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
    );
  }
}
