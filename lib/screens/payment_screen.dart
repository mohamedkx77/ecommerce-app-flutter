import 'package:boltecommerce/lang/appLocale.dart';
import 'package:boltecommerce/providers/cart.dart';
import 'package:boltecommerce/screens/check_out.dart';
import 'package:boltecommerce/widget/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatelessWidget {
  static const routeId = '/payment';

  @override
  Widget build(BuildContext context) {
    final cartPro = Provider.of<Cart>(context,listen: false);
    final translate = AppLocale.of(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
//        leading: IconButton(icon: Icon(Icons.keyboard_backspace), onPressed: ()=>cartPro.removeSingleItem()),
//        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
             translate.getTranslated('payment'),
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListView(
              children: <Widget>[
                Container(
                  height: 179,
                  width: 283,
                  child: Image.asset(
                    'assets/images/visa.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Container(
                  height: 179,
                  width: 283,
                  child: Image.asset(
                    'assets/images/visa.png',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Container(
                  height: 179,
                  width: 283,
                  child: Image.asset(
                    'assets/images/visa.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
              scrollDirection: Axis.horizontal,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      translate.getTranslated('subtotal'),
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text("\$${cartPro.totalAmount}"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      translate.getTranslated('discount'),
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text('\$${cartPro.allDiscount.toString()}'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      translate.getTranslated('shipping'),
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text("0.0"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 10,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      translate.getTranslated('total'),
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Text("\$${cartPro.totalAfterDiscount.toStringAsFixed(2)}"),
                  ],
                ),
              ],
            ),
          ),
//          Spacer(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed(CheckOut.routeId),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff667EEA),
                          Color(0xff6597F4),
                          Color(0xff64B0FD),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        translate.getTranslated('check_out'),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
