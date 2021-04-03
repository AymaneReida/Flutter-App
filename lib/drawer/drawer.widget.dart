import 'package:git_mobile_app/pages/counter/counter.page.dart';
import 'package:git_mobile_app/pages/home/home.page.dart';
import 'package:git_mobile_app/pages/users/users.page.dart';
import 'package:flutter/material.dart';
import 'drawer.header.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          MyDrawerHeaderWidget(),
          ListTile(
            leading: Icon(Icons.home, color: Color(0xff5e2750),),
            trailing: Icon(Icons.arrow_right, color: Color(0xff5e2750),),
            title: Text(
              "Home", style: TextStyle(fontSize: 18, color: Color(0xff77216f)),
            ),
            onTap: (){
              Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              Navigator.pushNamed(context, "/");
            },
          ),
          Divider(
            color: Color(0xff5e2750),
          ),
          ListTile(
            leading: Icon(Icons.calculate, color: Color(0xff5e2750),),
            trailing: Icon(Icons.arrow_right, color: Color(0xff5e2750),),
            title: Text(
              "Counter", style: TextStyle(fontSize: 18, color: Color(0xff77216f)),
            ),
            onTap: (){
              Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => CounterPage()));
              Navigator.pushNamed(context, "/counter");
            },
          ),
          Divider(
            color: Color(0xff5e2750),
          ),
          ListTile(
            leading: Icon(Icons.casino, color: Color(0xff5e2750),),
            trailing: Icon(Icons.arrow_right, color: Color(0xff5e2750),),
            title: Text(
              "Users", style: TextStyle(fontSize: 18, color: Color(0xff77216f)),
            ),
            onTap: (){
              Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage()));
              Navigator.pushNamed(context, "/users");
            },
          ),
          Divider(
            color: Color(0xff5e2750),
          ),
          ListTile(
            leading: Icon(Icons.add_photo_alternate_rounded, color: Color(0xff5e2750),),
            trailing: Icon(Icons.arrow_right, color: Color(0xff5e2750),),
            title: Text(
              "Gallery", style: TextStyle(fontSize: 18, color: Color(0xff77216f)),
            ),
            onTap: (){
              Navigator.pop(context);
              // Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage()));
              Navigator.pushNamed(context, "/gallery");
            },
          ),
          Divider(
            color: Color(0xff5e2750),
          ),
        ],
      ),
    );
  }
}
