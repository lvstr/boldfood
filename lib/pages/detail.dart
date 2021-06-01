import 'package:boldfood/model/foods_model.dart';
import 'package:flutter/material.dart';

import 'package:boldfood/utils/palette.dart';
import 'package:boldfood/elements/item_count.dart';
import 'package:boldfood/elements/size_button.dart';
import 'package:boldfood/elements/favorite_button.dart';

class DetailPage extends StatelessWidget {
  final Food food;

  DetailPage({required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Stack(
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.navigate_before,
                        color: Colors.black,
                        size: 35,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.black,
                        size: 35,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.only(left: 30, top: 30),
            child: Text(
              "${food.name}",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            )),
        Container(
            margin: EdgeInsets.only(left: 30, top: 4, right: 149),
            child: Text(
              "${food.description}",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFA4A4A4)),
            )),
        Container(
          margin: EdgeInsets.only(top: 50),
          alignment: Alignment.center,
          child: Image.asset(
            food.image,
            width: 315,
            height: 216,
          ),
        ),
        Container(
            margin: EdgeInsets.only(left: 30, top: 50),
            child: Text(
              "Size: ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )),
        SizeButton(),
        Container(
            margin: EdgeInsets.only(left: 30, top: 30),
            child: Text(
              "Quantity",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )),
        Row(children: <Widget>[
          ItemCount(food: food),
          Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 15, top: 60, left: 69),
                  child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFFF6F7FB),
                      child: FavoriteButton())),
              Container(
                  margin: EdgeInsets.only(top: 60),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Palette.theme,
                    child: IconButton(
                      onPressed: () => {},
                      icon: Icon(Icons.shopping_basket_outlined),
                      color: Colors.white,
                    ),
                  )),
            ],
          )
        ])
      ],
    )));
  }
}
