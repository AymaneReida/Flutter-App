import 'package:flutter/cupertino.dart';
import 'package:git_mobile_app/drawer/drawer.widget.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print("Widget render .............................");
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter Value => ${counter}",
              style: TextStyle(
                fontSize: 30,
                color: Color(0xff5e2750),
              ),
            ),
            IconButton(
                iconSize: 22,
                color: Color(0xff5e2750),
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    ++counter;
                  });
                }),
            IconButton(
                iconSize: 22,
                color: Color(0xff5e2750),
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    --counter;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
