import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:boldfood/utils/palette.dart';
import 'package:boldfood/elements/category.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
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
        body: SingleChildScrollView(
            child: Column(children: [
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
                    borderRadius: BorderRadius.all(Radius.circular(13.0))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(13.0))),
              ),
            ),
          ),
          Category(),
          Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 30.0),
              child: Text("Popular Food",
                  style: TextStyle(
                      fontSize: 30, height: 2.5, fontWeight: FontWeight.w900))),
                      FoodList(),
                      FoodList(),
                      FoodList(),
                      FoodList(),
                      FoodList(),
        ])));
  }
}

class FoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Container(
          height: 120.0,
          margin: EdgeInsets.only(left: 30.0, right: 30.0, top: 18.0),
          decoration: BoxDecoration(
            color: Color(0xFFF6F7FB),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 30.0),
          alignment: FractionalOffset.centerLeft,
          child: Image(
            image: AssetImage("images/foods/pizza.png"),
            height: 92.0,
            width: 180.0,
          ),
        ),
      ],
    ));
  }
}
