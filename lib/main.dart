import 'package:flutter/material.dart';
import 'package:git_mobile_app/pages/gallery/gallery.page.dart';
import 'package:git_mobile_app/pages/home/home.page.dart';
import 'package:git_mobile_app/pages/users/users.page.dart';
import 'package:git_mobile_app/pages/counter/counter.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xff5e2750,
            {
              50: Color(0xff5e2750),
              100: Color(0xff5e2750),
              200: Color(0xff5e2750),
              300: Color(0xff5e2750),
              400: Color(0xff5e2750),
              500: Color(0xff5e2750),
              600: Color(0xff5e2750),
              700: Color(0xff5e2750),
              800: Color(0xff5e2750),
              900: Color(0xff5e2750),
            }),
      ),
      routes: {
        "/":(context) => HomePage(),
        "/users":(context) => UsersPage(),
        "/counter": (context) => CounterPage(),
        "/gallery": (context) => GalleryPage(),
      },
      initialRoute: "/users",
    );
  }
}


