import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/CategoryModel.dart';
import 'package:flutter_ecommerce_app/common_widget/CircularProgress.dart';
import 'package:flutter_ecommerce_app/common_widget/GridTilesCategory.dart';
import 'package:flutter_ecommerce_app/utils/Urls.dart';
import 'package:http/http.dart';

List<CategoryModel> categories;

class CategoryPage extends StatefulWidget {
  String slug;
  bool isSubList;

  CategoryPage({Key key, this.slug, this.isSubList = false}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
  }

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
              return createListView(context, snapshot, widget.isSubList);
        }
      },
    );
  }
}

Widget createListView(
    BuildContext context, AsyncSnapshot snapshot, bool isSubList) {
  List<CategoryModel> values = snapshot.data;
  return GridView.count(
    crossAxisCount: 3,
//    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.all(1.0),
    childAspectRatio: 8.0 / 9.0,
    children: List<Widget>.generate(values.length, (index) {
      return GridTile(
          child: GridTilesCategory(
        name: values[index].name,
        imageUrl: values[index].imageUrl,
        slug: values[index].slug,
        fromSubProducts: isSubList,
      ));
    }),
  );
}

Future<List<CategoryModel>> getCategoryList(String slug, bool isSubList) async {
  if (isSubList) {
    categories = null;
  }
  if (categories == null) {
    Response response;
    response = await get(Urls.ROOT_URL + slug);
    int statusCode = response.statusCode;
    final body = json.decode(response.body);
    if (statusCode == 200) {
      categories =
          (body as List).map((i) => CategoryModel.fromJson(i)).toList();

      return categories;
    } else {
      return categories = List();
    }
  } else {
    return categories;
  }
}

// https://api.evaly.com.bd/core/public/categories/?parent=bags-luggage-966bc8aac     sub cate by slug
