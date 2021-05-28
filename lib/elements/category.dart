import 'package:flutter/material.dart';
import 'package:boldfood/utils/palette.dart';

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
          ],
        ));
  }
}
