import 'package:boldfood/widgets/custom_appbar.dart';
import 'package:boldfood/pages/comingsoon.dart';
import 'package:boldfood/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:boldfood/utils/palette.dart';
import 'package:boldfood/widgets/bottom_navbar.dart';
import 'package:boldfood/widgets/category.dart';
import 'package:boldfood/model/foods_model.dart';
import 'package:flutter/services.dart';

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
        drawer: Drawer(
            child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Center(
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image(
                      image: AssetImage('./images/profile.jpg'),
                      height: 130.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 10),
              child: Center(
                child: Container(
                    child: Text("John Doe",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
              ),
            ),
            Divider(
              color: Palette.theme,
              thickness: 1,
            ),
            Container(
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  _update(0);
                  CustomAppBar.pageController.jumpToPage(0);
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              child: ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                onTap: () {
                  _update(1);
                  CustomAppBar.pageController.jumpToPage(1);
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              child: ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Favorite'),
                onTap: () {
                  _update(2);
                  CustomAppBar.pageController.jumpToPage(2);
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              child: ListTile(
                leading: Icon(Icons.account_circle_rounded),
                title: Text('Account'),
                onTap: () {
                  _update(3);
                  CustomAppBar.pageController.jumpToPage(3);
                  Navigator.pop(context);
                },
              ),
            ),
            Divider(
              color: Palette.theme,
              thickness: 1,
            ),
            Container(
              child: ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text('Log Out'),
                  onTap: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text("Are you sure?"),
                          content: Text("You will Exit this App!"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: (() {
                                Navigator.pop(context, 'OK');
                                setState(() {
                                  SystemChannels.platform
                                      .invokeMethod('SystemNavigator.pop');
                                });
                              }),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      )),
            ),
          ],
        )),
        bottomNavigationBar:
            BottomNaviBar(currentIndex: _update, index: _currentIndex),
        body: CustomAppBar(currentIndex: _update, index: _currentIndex));
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
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text("Reason:",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFFA4A4A4))),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 5, right: 10),
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

class Buildd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.only(top: 30),
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ComingSoon();
                    }));
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      margin: EdgeInsets.only(right: 30, left: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              child: Icon(
                                Icons.account_circle_rounded,
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 11,
                              child: Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Text("Edit Profile",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600)))),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.navigate_next)))
                        ],
                      ))));
        });
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
          Center(
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image(
                  image: AssetImage('./images/profile.jpg'),
                  height: 150.0,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Center(
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text("John Doe",
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)))),
          Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 30),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ComingSoon();
                          }));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            margin: EdgeInsets.only(right: 30, left: 30),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Icon(
                                      Icons.account_circle_rounded,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 11,
                                    child: Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text("Edit Profile",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600)))),
                                Expanded(
                                    child: Container(
                                        alignment: Alignment.centerRight,
                                        child: Icon(Icons.navigate_next)))
                              ],
                            )))),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ComingSoon();
                          }));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Icon(
                                      Icons.map_outlined,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 11,
                                    child: Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text("Shipping Address",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600)))),
                                Expanded(
                                    child: Container(
                                        alignment: Alignment.centerRight,
                                        child: Icon(Icons.navigate_next)))
                              ],
                            )))),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ComingSoon();
                          }));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Icon(
                                      Icons.favorite_border_outlined,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 11,
                                    child: Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text("Wishlist",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600)))),
                                Expanded(
                                    child: Container(
                                        alignment: Alignment.centerRight,
                                        child: Icon(Icons.navigate_next)))
                              ],
                            )))),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ComingSoon();
                          }));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Icon(
                                      Icons.timelapse,
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 11,
                                    child: Container(
                                        margin: EdgeInsets.only(left: 15),
                                        child: Text("Order History",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600)))),
                                Expanded(
                                  child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Icon(Icons.navigate_next)),
                                )
                              ],
                            )))),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ComingSoon();
                          }));
                        },
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            margin: EdgeInsets.only(left: 30, right: 30),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Icon(
                                      Icons.credit_card,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 11,
                                  child: Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text("Payment",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600))),
                                ),
                                Expanded(
                                    child: Container(
                                        alignment: Alignment.centerRight,
                                        child: Icon(Icons.navigate_next)))
                              ],
                            )))),
              ]))
        ]));
  }
}
