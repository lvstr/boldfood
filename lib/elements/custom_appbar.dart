import 'package:boldfood/pages/home.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final ValueChanged<int> currentIndex;
  CustomAppBar({required this.currentIndex});
  static late PageController pageController;
  @override
  _CustomAppBar createState() => _CustomAppBar(currentIndex: currentIndex);
}

class _CustomAppBar extends State<CustomAppBar> {
  final ValueChanged<int> currentIndex;
  _CustomAppBar({required this.currentIndex});
  int _currentIndex = 0;
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
                _currentIndex == 1 || _currentIndex == 2
                    ? IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(_currentIndex == 1
                                ? 'Delete Notificaitons?'
                                : _currentIndex == 2
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
                                    _currentIndex == 1
                                        ? isNotificationEmpty = true
                                        : _currentIndex == 2
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
                _currentIndex == 1 || _currentIndex == 2
                    ? IconButton(
                        icon: Icon(
                          Icons.shopping_basket_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      )
                    : IconButton(
                        icon: Icon(
                          Icons.shopping_basket_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {},
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
                currentIndex(index);
                _currentIndex = index;
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
