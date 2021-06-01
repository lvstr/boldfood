import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:boldfood/utils/palette.dart';
import 'package:boldfood/elements/category.dart';
import 'package:boldfood/model/foods_model.dart';

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
              ])
            ]))
          ],
        ));
  }
}

class ListSearch extends StatefulWidget {
  ListSearchState createState() => ListSearchState();
}

class ListSearchState extends State<ListSearch> {
  TextEditingController _textController = TextEditingController();
  static List<String> mainDataList = [
    foods[foods.length].name,
    deserts[deserts.length].name,
    drinks[drinks.length].name,
    snacks[snacks.length].name
  ];

  // Copy Main List into New List.
  List<String> newDataList = List.from(mainDataList);

  onItemChanged(String value) {
    setState(() {
      newDataList = mainDataList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: _textController,
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
            onChanged: onItemChanged,
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(12.0),
            children: newDataList.map((data) {
              return ListTile(
                title: Text(data),
                onTap: () => print(data),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
