import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/brands/BrandHomePage.dart';
import 'package:flutter_ecommerce_app/category/CategorySlider.dart';
import 'package:flutter_ecommerce_app/common_widget/BottomNavBarWidget.dart';
import 'package:flutter_ecommerce_app/common_widget/SearchWidget.dart';
import 'package:flutter_ecommerce_app/shop/ShopHomePage.dart';

class SubCategoryPage extends StatelessWidget {
  String slug;

  SubCategoryPage({Key key, @required this.slug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Color(0xFF323232)),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Image.asset(
            "assets/images/ic_app_icon.png",
            width: 80,
            height: 40,
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none),
              color: Color(0xFF323232),
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SearchWidget(),
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
                      text: 'Sub Categories',
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
                      child: CategoryPage(
                          slug: 'categories/?parent=' + slug, isSubList: true),
                    ),
                    Container(
                      color: Colors.white24,
                      child: BrandHomePage(
                        slug: 'brands/?limit=20&page=1&category=' + slug,
                        isSubList: true,
                      ),
                    ),
                    Container(
                      color: Colors.white24,
                      child: ShopHomePage(
                        slug: 'category/shops/' + slug + '/?page=1&limit=15',
                        isSubList: true,
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
