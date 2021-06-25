import 'package:boldfood/pages/comingsoon.dart';
import 'package:boldfood/pages/home.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final ValueChanged<int> currentIndex;

  final int index;
  CustomAppBar({required this.currentIndex, required this.index});
  static late PageController pageController;
  @override
  _CustomAppBar createState() => _CustomAppBar();
}

class _CustomAppBar extends State<CustomAppBar> {
  bool isNotificationEmpty = false;
  bool isFavoriteEmpty = false;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      physics: ScrollPhysics(),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              backgroundColor: Colors.white,
              actions: <Widget>[
                widget.index == 1 || widget.index == 2
                    ? IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(widget.index == 1
                                ? 'Delete Notificaitons?'
                                : widget.index == 2
                                    ? 'Delete Favorite?'
                                    : ''),
                            content:
                                Text('If you delete it, you can get it back!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: (() {
                                  Navigator.pop(context, 'OK');
                                  setState(() {
                                    widget.index == 1
                                        ? isNotificationEmpty = true
                                        : widget.index == 2
                                            ? isFavoriteEmpty = true
                                            : isFavoriteEmpty = true;
                                  });
                                }),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
                widget.index == 1 || widget.index == 2
                    ? IconButton(
                        icon: Icon(
                          Icons.shopping_basket_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ComingSoon();
                          }));
                        },
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.shopping_basket_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ComingSoon();
                          }));
                        },
                      ),
              ],
              iconTheme: IconThemeData(color: Colors.black),
            ),
          ),
        ];
      },
      body: SizedBox.expand(
        child: PageView(
            controller: CustomAppBar.pageController,
            onPageChanged: (index) {
              setState(() {
                widget.currentIndex(index);
              });
            },
            children: <Widget>[
              ListView(
                children: <Widget>[
                  MainPage(),
                ],
              ),
              isNotificationEmpty
                  ? Center(
                      child: ListView(
                      primary: false,
                      shrinkWrap: true,
                      children: <Widget>[EmptyNotificationPage()],
                    ))
                  : ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        NotificationPage(),
                      ],
                    ),
              isFavoriteEmpty
                  ? Center(
                      child: ListView(
                          primary: false,
                          shrinkWrap: true,
                          children: <Widget>[EmptyFavoritePage()]))
                  : ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        FavoritePage(),
                      ],
                    ),
              ListView(
                children: <Widget>[
                  AccountPage(),
                ],
              ),
            ]),
      ),
    );
  }
}
