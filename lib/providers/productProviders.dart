import 'package:boltecommerce/providers/product.dart';
import 'package:flutter/foundation.dart';

class ProductProviders with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Woman T-Shirt',
      review: 4.5,
      description:
          'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.',
      img: 'assets/images/t1.png',
      price: 30.0,
    ),
    Product(
      id: 'p2',
      title: 'Woman T-Shirt',
      review: 2.5,
      description:
          'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.',
      img: 'assets/images/t2.png',
      price: 35.2,
    ),
    Product(
      id: 'p3',
      title: 'Shirt',
      review: 4.0,
      description:
          'A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart. I am alone, and feel the charm of existence in this spot, which was created for the bliss of souls like mine.',
      img: 'assets/images/t3.png',
      price: 45.5,
    ),
  ];

  List<Product> get items => _items;
  Product findById(String id) => _items.firstWhere((prod) => prod.id == id);
  List<Product> get favItems =>
      _items.where((prodItem) => prodItem.isFav).toList();
}
