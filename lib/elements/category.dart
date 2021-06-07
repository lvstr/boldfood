import 'package:flutter/material.dart';
import 'package:boldfood/utils/palette.dart';
import 'package:boldfood/model/foods_model.dart';
import 'package:boldfood/pages/detail.dart';

class Category extends StatefulWidget {
  @override
  _Category createState() => _Category();
}

class _Category extends State<Category> {
  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = [true, false, false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      margin: EdgeInsets.only(right: 3.0),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 12.0),
                      child: Text(
                        'Fast Food',
                        style: TextStyle(
                            color: Color(0xFFA4A4A4),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(right: 3.0),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 12.0),
                      child: Text(
                        'Fast Food',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Palette.theme),
                      ),
                    ),
              !isSelected[1]
                  ? Container(
                      margin: EdgeInsets.only(right: 3.0),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 12.0),
                      child: Text(
                        'Desert',
                        style: TextStyle(
                            color: Color(0xFFA4A4A4),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(right: 3.0),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 12.0),
                      child: Text(
                        'Desert',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Palette.theme),
                      ),
                    ),
              !isSelected[2]
                  ? Container(
                      margin: EdgeInsets.only(right: 3.0),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 12.0),
                      child: Text(
                        'Drinks',
                        style: TextStyle(
                            color: Color(0xFFA4A4A4),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(right: 3.0),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 12.0),
                      child: Text(
                        'Drinks',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Palette.theme),
                      ),
                    ),
              !isSelected[3]
                  ? Container(
                      margin: EdgeInsets.only(right: 3.0),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 12.0),
                      child: Text(
                        'Snacks',
                        style: TextStyle(
                            color: Color(0xFFA4A4A4),
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(right: 3.0),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 12.0),
                      child: Text(
                        'Snacks',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Palette.theme),
                      ),
                    ),
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
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 30.0, top: 30),
              child: Text(
                  'Popular ${isSelected[0] ? "Fast Food" : isSelected[1] ? "Desert" : isSelected[2] ? "Drinks" : isSelected[3] ? "Snacks" : "Snacks"}',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900))),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: isSelected[0]
                ? foods.length
                : isSelected[1]
                    ? deserts.length
                    : isSelected[2]
                        ? drinks.length
                        : isSelected[3]
                            ? snacks.length
                            : snacks.length,
            itemBuilder: isSelected[0]
                ? (BuildContext context, int index) {
                    final Food food = foods[index];

                    return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailPage(food: food);
                          }));
                        },
                        child: Container(
                            child: Stack(
                          children: <Widget>[
                            Container(
                              height: 120.0,
                              margin: EdgeInsets.only(
                                  left: 30.0, right: 30.0, top: 18.0),
                              decoration: BoxDecoration(
                                color: Color(0xFFF6F7FB),
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: 30.0,
                                          bottom: 30.0,
                                          left: 40,
                                          right: 18),
                                      alignment: FractionalOffset.centerLeft,
                                      child: ClipRRect(
                                        borderRadius:
                                            new BorderRadius.circular(50.0),
                                        child: Image(
                                          image: AssetImage(food.imageIcon),
                                          height: 92.0,
                                          fit: BoxFit.fill,
                                        ),
                                      )),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(food.name,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        Text(food.title,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFFA4A4A4))),
                                        Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text("IDR ${food.price}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    ),
                                  ),
                                ]),
                            Container(
                                margin: EdgeInsets.only(top: 75, right: 35),
                                alignment: Alignment.bottomRight,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      primary: Palette.theme,
                                      padding: EdgeInsets.all(14)),
                                )),
                          ],
                        )));
                  }
                : isSelected[1]
                    ? (BuildContext context, int index) {
                        final Food desert = deserts[index];

                        return InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return DetailPage(food: desert);
                              }));
                            },
                            child: Container(
                                child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 120.0,
                                  margin: EdgeInsets.only(
                                      left: 30.0, right: 30.0, top: 18.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFF6F7FB),
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          margin: EdgeInsets.only(
                                              top: 30.0,
                                              bottom: 30.0,
                                              left: 40,
                                              right: 18),
                                          alignment:
                                              FractionalOffset.centerLeft,
                                          child: ClipRRect(
                                            borderRadius:
                                                new BorderRadius.circular(50.0),
                                            child: Image(
                                              image:
                                                  AssetImage(desert.imageIcon),
                                              height: 92.0,
                                              fit: BoxFit.fill,
                                            ),
                                          )),
                                      Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(desert.name,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                            Text(desert.title,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFFA4A4A4))),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: Text(
                                                    "IDR ${desert.price}",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold)))
                                          ],
                                        ),
                                      ),
                                    ]),
                                Container(
                                    margin: EdgeInsets.only(top: 75, right: 35),
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 24.0,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          shape: CircleBorder(),
                                          primary: Palette.theme,
                                          padding: EdgeInsets.all(14)),
                                    )),
                              ],
                            )));
                      }
                    : isSelected[2]
                        ? (BuildContext context, int index) {
                            final Food drink = drinks[index];

                            return InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DetailPage(food: drink);
                                  }));
                                },
                                child: Container(
                                    child: Stack(
                                  children: <Widget>[
                                    Container(
                                      height: 120.0,
                                      margin: EdgeInsets.only(
                                          left: 30.0, right: 30.0, top: 18.0),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF6F7FB),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              margin: EdgeInsets.only(
                                                  top: 30.0,
                                                  bottom: 30.0,
                                                  left: 40,
                                                  right: 18),
                                              alignment:
                                                  FractionalOffset.centerLeft,
                                              child: ClipRRect(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        50.0),
                                                child: Image(
                                                  image: AssetImage(
                                                      drink.imageIcon),
                                                  height: 92.0,
                                                  fit: BoxFit.fill,
                                                ),
                                              )),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(drink.name,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                Text(drink.title,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xFFA4A4A4))),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    child: Text(
                                                        "IDR ${drink.price}",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)))
                                              ],
                                            ),
                                          ),
                                        ]),
                                    Container(
                                        margin:
                                            EdgeInsets.only(top: 75, right: 35),
                                        alignment: Alignment.bottomRight,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 24.0,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: CircleBorder(),
                                              primary: Palette.theme,
                                              padding: EdgeInsets.all(14)),
                                        )),
                                  ],
                                )));
                          }
                        : (BuildContext context, int index) {
                            final Food snack = snacks[index];

                            return InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DetailPage(food: snack);
                                  }));
                                },
                                child: Container(
                                    child: Stack(
                                  children: <Widget>[
                                    Container(
                                      height: 120.0,
                                      margin: EdgeInsets.only(
                                          left: 30.0, right: 30.0, top: 18.0),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFF6F7FB),
                                        shape: BoxShape.rectangle,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              margin: EdgeInsets.only(
                                                  top: 30.0,
                                                  bottom: 30.0,
                                                  left: 40,
                                                  right: 18),
                                              alignment:
                                                  FractionalOffset.centerLeft,
                                              child: ClipRRect(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        50.0),
                                                child: Image(
                                                  image: AssetImage(
                                                      snack.imageIcon),
                                                  height: 92.0,
                                                  fit: BoxFit.fill,
                                                ),
                                              )),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(snack.name,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    )),
                                                Text(snack.title,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xFFA4A4A4))),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        top: 10),
                                                    child: Text(
                                                        "IDR ${snack.price}",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)))
                                              ],
                                            ),
                                          ),
                                        ]),
                                    Container(
                                        margin:
                                            EdgeInsets.only(top: 75, right: 35),
                                        alignment: Alignment.bottomRight,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 24.0,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: CircleBorder(),
                                              primary: Palette.theme,
                                              padding: EdgeInsets.all(14)),
                                        )),
                                  ],
                                )));
                          },
          )
        ],
      ),
    );
  }
}
