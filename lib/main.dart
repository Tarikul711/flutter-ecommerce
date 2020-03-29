import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common_widget/BottomNavBarWidget.dart';
import 'package:flutter_ecommerce_app/common_widget/DrawerWidget.dart';
import 'package:flutter_ecommerce_app/screens/HomeScreen.dart';
import 'package:flutter_ecommerce_app/screens/ShoppingCartScreen.dart';
import 'package:flutter_ecommerce_app/screens/WishListScreen.dart';
import 'package:flutter_ecommerce_app/sign_in_up/SignIn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
          primaryColor: Colors.white,
          primaryColorDark: Colors.white,
          backgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
    );
  }
}

int currentIndex = 0;

void navigateToScreens(int index) {
  currentIndex=index;
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageNewState createState() => _MyHomePageNewState();
}

class _MyHomePageNewState extends State<MyHomePage> {
  final List<Widget> viewContainer = [
    HomeScreen(),
    WishListScreen(),
    ShoppingCartScreen(),
    HomeScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Image.asset(
            "assets/images/ic_app_icon.png",
            width: 80,
            height: 40,
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppSignIn()),
                );
              },
              icon: Icon(Icons.account_circle),
              color: Color(0xFF323232),
            ),
          ],
        ),
        drawer: DrawerWidget(),
        body: IndexedStack(
          index: currentIndex,
          children: viewContainer,
        ),
        bottomNavigationBar: BottomNavBarWidget(),
      ),
    );
  }
}

//https://api.evaly.com.bd/core/public/products/?page=1&limit=12&category=facial-cleansing-brushes-84365a5ee

//https://api.evaly.com.bd/core/public/products/?page=1&limit=12&category=bags-luggage-966bc8aac
