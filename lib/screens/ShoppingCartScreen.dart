import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyShoppingCartScreen();
  }
}

class EmptyShoppingCartScreen extends StatefulWidget {
  @override
  _EmptyShoppingCartScreenState createState() =>
      _EmptyShoppingCartScreenState();
}

class _EmptyShoppingCartScreenState extends State<EmptyShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 70,
              child: Container(
                color: Color(0xFFFFFFFF),
              ),
            ),
            Container(
              width: double.infinity,
              height: 250,
              child: Image.asset(
                "assets/images/empty_shopping_cart.png",
                height: 250,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 40,
              child: Container(
                color: Color(0xFFFFFFFF),
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                "You haven't anything to cart",
                style: TextStyle(
                  color: Color(0xFF67778E),
                  fontFamily: 'Roboto-Light.ttf',
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
