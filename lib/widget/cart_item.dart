import 'dart:io';

import 'package:boltecommerce/lang/appLocale.dart';
import 'package:boltecommerce/providers/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;
  final String img;
  CartItem({
    this.id,
    this.productId,
    this.title,
    this.quantity,
    this.price,
    this.img,
  });

  @override
  Widget build(BuildContext context) {
    final translate = AppLocale.of(context);
    final dismissProd = Provider.of<Cart>(context, listen: false);
    var total = price * quantity;
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => dismissProd.removeItems(productId),
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (context) =>
          Platform.isIOS ? CupertinoAlertDialog(
            title: Text(translate.getTranslated('title_remove_someThing')),
            content: Text(translate.getTranslated('remove_from_cart')),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(translate.getTranslated('no')),
              ),
              CupertinoDialogAction(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(translate.getTranslated('yes')),
              ),
            ],
          ) :
          AlertDialog(
            title: Text(translate.getTranslated('title_remove_someThing')),
            content: Text(translate.getTranslated('remove_from_cart')),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(translate.getTranslated('no')),
              ),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(translate.getTranslated('yes')),
              ),
            ],
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 138,
            child: Row(
              children: <Widget>[
                translate.locale.languageCode == 'en' ?
                Padding(
                   padding: EdgeInsets.only(right: 15),
                  child: Container(
                    width: 120,
                    child: Image.network(
                      img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ) :  Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Container(
                    width: 120,
                    child: Image.network(
                      img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '\$${total.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18, color: Color(0xff374ABE)),
                    ),
                    Transform.translate(
                      offset: Offset(0, 20),
                      child: Container(
                        width: 114,
                        height: 42,
                        color: Color(0xffF6F6F6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () => dismissProd.removeOne(productId),
                              splashColor: Colors.white,
                            ),
                            Text(quantity.toString()),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () => dismissProd.addOne(productId),
                              splashColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Are You Sure?"),
                          content: Text(
                              "Do You Want to remove the Item From The Cart?"),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text("No"),
                            ),
                            FlatButton(
                              onPressed: () {
                                dismissProd.removeItems(productId);
                                Navigator.of(context).pop();
                              },
                              child: Text("Yes"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
