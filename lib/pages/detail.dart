import 'package:boldfood/model/foods_model.dart';
import 'package:boldfood/utils/palette.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Foods food;

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
            food.imageBig,
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
          ListTileItem(food: food),
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

class ListTileItem extends StatefulWidget {
  final Foods food;

  ListTileItem({required this.food});

  @override
  _ListTileItemState createState() => _ListTileItemState(food: food);
}

class _ListTileItemState extends State<ListTileItem> {
  final Foods food;

  _ListTileItemState({required this.food});

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

class SizeButton extends StatefulWidget {
  @override
  _SizeButton createState() => _SizeButton();
}

class _SizeButton extends State<SizeButton> {
  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = [true, false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 30, top: 10),
        child: Row(
          children: <Widget>[
            ToggleButtons(
              borderColor: Colors.transparent,
              fillColor: Colors.transparent,
              borderWidth: null,
              selectedBorderColor: Colors.transparent,
              splashColor: Colors.transparent,
              children: <Widget>[
                !isSelected[0]
                    ? Container(
                        margin: EdgeInsets.only(right: 15),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFFF6F7FB),
                          child: Text("S",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(right: 15),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Palette.theme,
                          child: Text(
                            "S",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        )),
                !isSelected[1]
                    ? Container(
                        margin: EdgeInsets.only(right: 15),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFFF6F7FB),
                          child: Text("M",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(right: 15),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Palette.theme,
                          child: Text(
                            "M",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        )),
                !isSelected[2]
                    ? Container(
                        margin: EdgeInsets.only(right: 15),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color(0xFFF6F7FB),
                          child: Text("L",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black)),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(right: 15),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Palette.theme,
                          child: Text(
                            "L",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        )),
              ],
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = i == index;
                  }
                });
              },
              isSelected: isSelected,
            ),
          ],
        ));
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.black,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
