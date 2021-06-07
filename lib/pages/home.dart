import 'package:boldfood/elements/custom_appbar.dart';
import 'package:boldfood/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:boldfood/utils/palette.dart';
import 'package:boldfood/elements/bottom_navbar.dart';
import 'package:boldfood/elements/category.dart';
import 'package:boldfood/model/foods_model.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    CustomAppBar.pageController = PageController();
  }

  @override
  void dispose() {
    CustomAppBar.pageController.dispose();
    super.dispose();
  }

  void _update(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        bottomNavigationBar:
            BottomNaviBar(currentIndex: _update, index: _currentIndex),
        body: CustomAppBar(currentIndex: _update));
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(right: 30.0, left: 30.0),
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
    ]);
  }
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 90.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F7FB),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: EdgeInsets.only(
                        left: 30, right: 30, bottom: 10, top: 10),
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Your Food is coming..",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.orange)),
                        Text("Driver: Mr. Sudono",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFA4A4A4))),
                        Container(
                            margin: EdgeInsets.only(top: 10, right: 10),
                            width: 312,
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                    "Hey! Your food Pizza Hot is coming, please wait and Wear mask! ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))))
                      ],
                    ),
                  ),
                ]),
          ),
          InkWell(
            onTap: () {},
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 90.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F7FB),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: EdgeInsets.only(
                        left: 30, right: 30, bottom: 10, top: 10),
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Your Food has been arrived..",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Palette.theme)),
                        Text("Driver: Mr. Sudono",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFA4A4A4))),
                        Container(
                            margin: EdgeInsets.only(top: 10, right: 10),
                            width: 312,
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                    "Hey! Your food Pizza Hot has been arrived, please pay and Wear mask! ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))))
                      ],
                    ),
                  ),
                ]),
          ),
          InkWell(
            onTap: () {},
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F7FB),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: EdgeInsets.only(
                        left: 30, right: 30, bottom: 10, top: 10),
                    padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Your Food is canceled..",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.red)),
                        Text("Driver: Mrs. Sutiya",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFA4A4A4))),
                        Container(
                            margin: EdgeInsets.only(top: 10, right: 10),
                            width: 312,
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text(
                                    "Hey! Your food Hamburger has been cancelled! ",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)))),
                        Text("Reason:",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFA4A4A4))),
                        Container(
                            margin: EdgeInsets.only(top: 10, right: 10),
                            child: FittedBox(
                                fit: BoxFit.fitWidth,
                                child: Text("Out of Stock!",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))))
                      ],
                    ),
                  ),
                ]),
          )
        ]);
  }
}

class EmptyNotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Center(
            child: Text(
          "There's no Notication",
          style: TextStyle(color: Color(0xFFE0E0E0)),
          textAlign: TextAlign.center,
        )));
  }
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        margin: EdgeInsets.only(right: 30.0, left: 30.0),
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
      ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            final Food food = foods[index];

            return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailPage(food: food);
                  }));
                },
                child: Container(
                    child: Stack(
                  children: <Widget>[
                    Container(
                      height: 120.0,
                      margin:
                          EdgeInsets.only(left: 30.0, right: 30.0, top: 18.0),
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
                                  top: 30.0, bottom: 30.0, left: 40, right: 18),
                              alignment: FractionalOffset.centerLeft,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(50.0),
                                child: Image(
                                  image: AssetImage(food.imageIcon),
                                  height: 92.0,
                                  fit: BoxFit.fill,
                                ),
                              )),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                            fontWeight: FontWeight.bold)))
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
          })
    ]);
  }
}

class EmptyFavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Center(
            child: Text(
          "There's no Favorite Food",
          style: TextStyle(color: Color(0xFFE0E0E0)),
          textAlign: TextAlign.center,
        )));
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
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
