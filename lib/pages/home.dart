import 'package:boldfood/model/foods_model.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:boldfood/utils/palette.dart';
import 'package:boldfood/elements/category.dart';
import 'package:boldfood/pages/detail.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        bottomNavigationBar: BottomNavyBar(
          showElevation: false,
          backgroundColor: Color(0xFFF6F7FB),
          selectedIndex: _currentIndex,
          itemCornerRadius: 20,
          curve: Curves.easeIn,
          onItemSelected: (index) => setState(() => _currentIndex = index),
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                activeColor: Color(0xff11ac6a),
                textAlign: TextAlign.center,
                inactiveColor: Color(0xFFBABABA)),
            BottomNavyBarItem(
                icon: Icon(Icons.notifications),
                title: Text('Notifications'),
                activeColor: Palette.theme,
                textAlign: TextAlign.center,
                inactiveColor: Color(0xFFBABABA)),
            BottomNavyBarItem(
                icon: Icon(Icons.favorite),
                title: Text(
                  'Favorite',
                ),
                activeColor: Palette.theme,
                textAlign: TextAlign.center,
                inactiveColor: Color(0xFFBABABA)),
            BottomNavyBarItem(
                icon: Icon(Icons.account_circle),
                title: Text('Account'),
                activeColor: Palette.theme,
                textAlign: TextAlign.center,
                inactiveColor: Color(0xFFBABABA)),
          ],
        ),
        body: CustomScrollView(
          physics: ScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.white,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.shopping_basket_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                )
              ],
              iconTheme: IconThemeData(color: Colors.black),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Column(children: [
                Container(
                  margin: EdgeInsets.only(right: 30.0, left: 30.0, top: 30.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      filled: true,
                      fillColor: Color(0xFFF6F7FB),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () => {},
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE0E0E0)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(13.0))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius:
                              BorderRadius.all(Radius.circular(13.0))),
                    ),
                  ),
                ),
                Category(),
                Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 30.0, top: 30),
                    child: Text("Popular Food",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900))),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final Foods food = foods[index];

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
                                margin: EdgeInsets.fromLTRB(295, 75, 0, 0),
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
                  itemCount: foods.length,
                )
              ])
            ]))
          ],
        ));
  }
}
