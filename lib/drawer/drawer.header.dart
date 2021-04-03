import 'package:flutter/material.dart';

class MyDrawerHeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff5e2750),
            Color(0xff4c5fd7)
          ]
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("images/logo.png"),
            radius: 40,
          )
        ],
      ),
    );
  }
}