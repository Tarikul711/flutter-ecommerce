import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common_widget/CircularProgress.dart';
import 'package:flutter_ecommerce_app/common_widget/GridTilesCategory.dart';
import 'package:flutter_ecommerce_app/utils/Urls.dart';
import 'package:http/http.dart';

import '../models/BrandModel.dart';

BrandModel brandModel;

class BrandHomePage extends StatefulWidget {
  String slug;
  bool isSubList;

  BrandHomePage({Key key, this.slug, this.isSubList=false}) : super(key: key);
  @override
  _BrandHomePageState createState() => _BrandHomePageState();
}

class _BrandHomePageState extends State<BrandHomePage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCategoryList(widget.slug,widget.isSubList),
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
  BrandModel values = snapshot.data;
  List<Results> results = values.results;
  return GridView.count(
    crossAxisCount: 3,
    padding: EdgeInsets.all(1.0),
    childAspectRatio: 8.0 / 9.0,
    children: List<Widget>.generate(results.length, (index) {
      return GridTile(
          child: GridTilesCategory(
              name: results[index].name,
              imageUrl: results[index].imageUrl,
              slug: results[index].slug));
    }),
  );
}

Future<BrandModel> getCategoryList(String slug, bool isSubList) async {
  if (brandModel == null) {
    Response response = await get(Urls.ROOT_URL + slug);
    int statusCode = response.statusCode;
    var body = json.decode(response.body);
    log('${body}');
    if (statusCode == 200) {
      brandModel = BrandModel.fromJson(body);
//    brandModel = (body).map((i) =>BrandModel.fromJson(body)) ;
      return brandModel;
    }
  } else {
    return brandModel;
  }
}

//https://api.evaly.com.bd/core/public/brands/?limit=20&page=1&category=bags-luggage-966bc8aac