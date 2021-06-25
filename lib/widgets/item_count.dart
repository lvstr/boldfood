import 'package:boldfood/model/foods_model.dart';
import 'package:flutter/material.dart';

import 'package:boldfood/utils/palette.dart';

class ItemCount extends StatefulWidget {
  final Food food;

  ItemCount({required this.food});

  @override
  _ItemCountState createState() => _ItemCountState(food: food);
}

class _ItemCountState extends State<ItemCount> {
  final Food food;

  _ItemCountState({required this.food});

  int _itemCount = 1;
  late double finalprice;

  void decrement() {
    _itemCount == 1 ? _itemCount = 1 : _itemCount--;
    finalprice = double.parse(food.price) * _itemCount;
  }

  void increment() {
    _itemCount++;
    finalprice = double.parse(food.price) * _itemCount;
  }

  void initState() {
    super.initState();
    finalprice = double.parse(food.price);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 30, top: 10),
              child: Row(
                children: <Widget>[
                  _itemCount == 1 || _itemCount >= 1 || _itemCount < 1
                      ? Container(
                          margin: EdgeInsets.only(right: 16),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Color(0xFFF6F7FB),
                            child: IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () => setState(() => decrement())),
                          ))
                      : Container(),
                  Text(_itemCount.toString(),
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Palette.theme,
                      child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.add),
                          onPressed: () => setState(() => increment())),
                    ),
                  )
                ],
              )),
          Container(
              margin: EdgeInsets.only(left: 30, top: 20),
              child: Text(
                "Price",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFA4A4A4)),
              )),
          Container(
              margin: EdgeInsets.only(left: 30, top: 9),
              child: Text(
                "IDR ${finalprice.toStringAsFixed(3)}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ]);
  }
}
