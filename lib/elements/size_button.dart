import 'package:flutter/material.dart';

import 'package:boldfood/utils/palette.dart';

class SizeButton extends StatefulWidget {
  @override
  _SizeButtonState createState() => _SizeButtonState();
}

class _SizeButtonState extends State<SizeButton> {
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
