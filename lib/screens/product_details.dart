import 'package:boltecommerce/lang/appLocale.dart';
import 'package:boltecommerce/providers/auth.dart';
import 'package:boltecommerce/providers/cart.dart';
import 'package:boltecommerce/providers/productProviders.dart';
import 'package:boltecommerce/screens/Address_screen.dart';
import 'package:boltecommerce/screens/cart_screen.dart';
import 'package:boltecommerce/widget/badge.dart';
import 'package:boltecommerce/widget/containerSize.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum sizeType {
  S,
  L,
  M,
  XXL,
}

class ProductDetails extends StatefulWidget {
  static const routeId = 'product_details';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  sizeType selectedSize;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final translate = AppLocale.of(context);
//    final loadedProduct = Provider.of<Product>(context);
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<ProductProviders>(context, listen: false)
        .findById(productId);
    final cartPro = Provider.of<Cart>(context, listen: false);
    const activeCardColor = Color(0xff667EEA);
    const inActiveColor = Color(0xffE1E1E1);
    final authData = Provider.of<Auth>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
//      appBar: AppBar(
//        backgroundColor: Colors.white,
//        elevation: 0,
////        leading: Icon(Icons.expand_less),
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(
//                loadedProduct.isFav ? Icons.favorite : Icons.favorite_border),
//            color: Colors.red,
//            onPressed: () {
//              setState(() {
//                loadedProduct.toggleFav(authData.token, authData.userId);
//              });
//            },
//          ),
//          Consumer<Cart>(
//            builder: (context, cartP, ch) => Badge(
//              value: cartP.itemCount.toString(),
//              child: IconButton(
//                icon: Icon(Icons.shopping_cart),
//                onPressed: () =>
//                    Navigator.of(context).pushNamed(CartScreen.routeId),
//              ),
//            ),
//          ),
//        ],
//      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 400,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  height: 300,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Image.network(
                    loadedProduct.img,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                      loadedProduct.isFav ? Icons.favorite : Icons.favorite_border),
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      loadedProduct.toggleFav(authData.token, authData.userId);
                    });
                  },
                ),
                Consumer<Cart>(
                  builder: (context, cartP, ch) => Badge(
                    value: cartP.itemCount.toString(),
                    child: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () =>
                          Navigator.of(context).pushNamed(CartScreen.routeId),
                    ),
                  ),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          loadedProduct.title,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "\$${loadedProduct.price}",
                          style:
                              TextStyle(color: Color(0xff667EEA), fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        height: 10,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 8,
                          bottom: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 65,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Color(0xff667EEA),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  loadedProduct.review.toString() ,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              translate.getTranslated('VeryGood'),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Spacer(),
                            Text(
                              translate.getTranslated('reviews'),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff667EEA),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 10,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          translate.getTranslated('description'),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          loadedProduct.description,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        height: 10,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              translate.getTranslated('select_size'),
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              translate.getTranslated('select_color'),
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 10,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          BuildContainerSize(
                            size: "S",
                            color: selectedSize == sizeType.S
                                ? activeCardColor
                                : inActiveColor,
                            onTap: () {
                              setState(() {
                                selectedSize = sizeType.S;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          BuildContainerSize(
                            size: "M",
                            color: selectedSize == sizeType.M
                                ? activeCardColor
                                : inActiveColor,
                            onTap: () {
                              setState(() {
                                selectedSize = sizeType.M;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          BuildContainerSize(
                            size: "L",
                            color: selectedSize == sizeType.L
                                ? activeCardColor
                                : inActiveColor,
                            onTap: () {
                              setState(() {
                                selectedSize = sizeType.L;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = sizeType.XXL;
                              });
                            },
                            child: Text(
                              "XLL",
                              style: TextStyle(
                                color: selectedSize == sizeType.XXL
                                    ? activeCardColor
                                    : inActiveColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 35),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                color: Color(0xffD8D6D6),
                                textColor: Colors.white,
                                onPressed: () {
                                  cartPro.addItem(
                                    loadedProduct.id,
                                    loadedProduct.price,
                                    loadedProduct.title,
                                    loadedProduct.discount,
                                    loadedProduct.shipping,
                                    loadedProduct.img,
                                  );
                                  _scaffoldKey.currentState.hideCurrentSnackBar();
                                  _scaffoldKey.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text(translate
                                          .getTranslated('snakeBar_add_to_cart')),
                                      duration: Duration(seconds: 2),
                                      action: SnackBarAction(
                                        label: translate.getTranslated('undo'),
                                        onPressed: () => cartPro
                                            .removeSingleItem(loadedProduct.id),
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  translate.getTranslated('add_to_cart'),
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                textColor: Colors.white,
                                color: Color(0XFF667EEA),
                                onPressed: () {
                                  cartPro.addItem(
                                      productId,
                                      loadedProduct.price,
                                      loadedProduct.title,
                                      loadedProduct.discount,
                                      loadedProduct.shipping,
                                      loadedProduct.img);
                                  Navigator.of(context).pushNamed(
                                      AddressScreen.routeId,
                                      arguments: loadedProduct.id);
                                },
                                child: Text(
                                  translate.getTranslated('buy_now'),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
//        child:
        ),
      ),
    );
  }
}
