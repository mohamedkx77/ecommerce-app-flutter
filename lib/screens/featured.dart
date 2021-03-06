import 'package:boltecommerce/lang/appLocale.dart';
import 'package:boltecommerce/widget/featuredList.dart';
import 'package:flutter/material.dart';

class FeaturedPage extends StatelessWidget {
  static const routeId = "/Featured";
  @override
  Widget build(BuildContext context) {
    final translate = AppLocale.of(context);

    var _showFavOnly = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
//        leading: Icon(Icons.expand_less),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              translate.getTranslated('featured'),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              child: FeaturedList(_showFavOnly),
            ),
          ),
        ],
      ),
    );
  }
}
