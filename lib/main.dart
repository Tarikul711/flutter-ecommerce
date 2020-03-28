import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/brans/BrandHomePage.dart';
import 'package:flutter_ecommerce_app/category/CategorySlider.dart';
import 'package:flutter_ecommerce_app/common_widget/BottomNavBarWidget.dart';
import 'package:flutter_ecommerce_app/common_widget/PopularMenu.dart';
import 'package:flutter_ecommerce_app/common_widget/SearchWidget.dart';
import 'package:flutter_ecommerce_app/common_widget/TopPromoSlider.dart';
import 'package:flutter_ecommerce_app/shop/ShopHomePage.dart';
import 'package:flutter_ecommerce_app/sign_in_up/SignIn.dart';
import 'package:flutter_ecommerce_app/sign_in_up/SignUp.dart';

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

class MyHomePageNew extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "eValy",
            style: TextStyle(
                color: Color(0xFF323232), fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle),
              color: Color(0xFF323232),
            ),
          ],
        ),
        drawer: Drawer(),
        body: Column(
          children: <Widget>[
            SearchWidget(),
            TopPromoSlider(),
            PopularMenu(),
            SizedBox(
              height: 10,
              child: Container(
                color: Color(0xFFf5f6f7),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavBarWidget());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageNewState createState() => _MyHomePageNewState();
}

class _MyHomePageNewState extends State<MyHomePage> {
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
        drawer: Drawer(),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SearchWidget(),
              TopPromoSlider(),
              PopularMenu(),
              SizedBox(
                height: 10,
                child: Container(
                  color: Color(0xFFf5f6f7),
                ),
              ),
              PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: TabBar(
                  labelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: 'Categories',
                    ),
                    Tab(
                      text: 'Brands',
                    ),
                    Tab(
                      text: 'Shops',
                    )
                  ], // list of tabs
                ),
              ),
              SizedBox(
                height: 10,
                child: Container(
                  color: Color(0xFFf5f6f7),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      color: Colors.white24,
                      child: CategoryPage(slug: 'categories/'),
                    ),
                    Container(
                      color: Colors.white24,
                      child: BrandHomePage(slug: 'brands/?limit=20&page=1'),
                    ),
                    Container(
                      color: Colors.white24,
                      child: ShopHomePage(
                        slug: 'custom/shops/?page=1&limit=15',
                      ),
                    ) // class name
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBarWidget(),
      ),
    );
  }
}

//https://api.evaly.com.bd/core/public/products/?page=1&limit=12&category=facial-cleansing-brushes-84365a5ee

//https://api.evaly.com.bd/core/public/products/?page=1&limit=12&category=bags-luggage-966bc8aac
