import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/category/SubCategoryPage.dart';

class GridTilesCategory extends StatelessWidget {
  String name;
  String imageUrl;
  String slug;

  GridTilesCategory(
      {Key key,
      @required this.name,
      @required this.imageUrl,
      @required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SubCategoryPage(slug: slug,)),
        );
      },
      child: Card(
          color: Colors.white,
          elevation: 0,
          child: Center(
            child: Column(
              children: <Widget>[
                Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                ),
                Text(name,
                    style: TextStyle(
                        color: Color(0xFF000000),
                        fontFamily: 'Roboto-Light.ttf',
                        fontSize: 12))
              ],
            ),
          )),
    );
  }
}
