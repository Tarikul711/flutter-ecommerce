import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return EmptyWishListScreen();
  }
}

class EmptyWishListScreen extends StatefulWidget {
  @override
  _EmptyWishListScreenState createState() =>
      _EmptyWishListScreenState();
}

class _EmptyWishListScreenState extends State<EmptyWishListScreen> {
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
                "assets/images/empty_wish_list.png",
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
                "You haven't anything to wish List",
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
