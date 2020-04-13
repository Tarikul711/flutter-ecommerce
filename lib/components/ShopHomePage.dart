import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common_widget/CircularProgress.dart';
import 'package:flutter_ecommerce_app/common_widget/GridTilesCategory.dart';
import 'package:flutter_ecommerce_app/models/ShopModel.dart';
import 'package:flutter_ecommerce_app/utils/Urls.dart';
import 'package:http/http.dart';

ShopModel shopModel;

class ShopHomePage extends StatefulWidget {
  String slug;
  bool isSubList;

  ShopHomePage({Key key, this.slug, this.isSubList=false}) : super(key: key);
  @override
  _ShopHomePageState createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCategoryList(widget.slug, widget.isSubList),
      builder: (context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return CircularProgress();
          default:
            if (snapshot.hasError)
              return Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    );
  }
}

Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
  ShopModel values = snapshot.data;
  List<Data> results = values.data;
  return GridView.count(
    crossAxisCount: 3,
    padding: EdgeInsets.all(1.0),
    childAspectRatio: 8.0 / 9.0,
    children: List<Widget>.generate(results.length, (index) {
      return GridTile(
          child: GridTilesCategory(
              name: results[index].shopName,
              imageUrl: results[index].shopImage,slug:results[index].slug));
    }),
  );
}

Future<ShopModel> getCategoryList(String slug, bool isSubList) async {
  if (isSubList) {
    shopModel = null;
  }
  if (shopModel == null) {
    Response response =
        await get(Urls.ROOT_URL + slug);
    int statusCode = response.statusCode;
    var body = json.decode(response.body);
    log('${body}');
    if (statusCode == 200) {
      shopModel = ShopModel.fromJson(body);
//    brandModel = (body).map((i) =>BrandModel.fromJson(body)) ;
      return shopModel;
    }
  } else {
    return shopModel;
  }
}
//https://api.evaly.com.bd/core/public/category/shops/bags-luggage-966bc8aac/?page=1&limit=15