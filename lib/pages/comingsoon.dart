import 'package:boldfood/pages/home.dart';
import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Coming Soon :)",
            style: TextStyle(color: Colors.black, fontSize: 30),
          )),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Home();
                    }));
                  },
                  child: Text("Back")))
        ],
      ),
    ));
  }
}
