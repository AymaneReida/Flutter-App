import 'package:flutter/material.dart';
import 'package:git_mobile_app/drawer/drawer.widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      drawer: MyDrawer(),
      body: Center(
        child: Text("Home Page", style: Theme.of(context).textTheme.headline1,),
      ),
    );
  }
}