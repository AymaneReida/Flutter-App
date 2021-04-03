import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:git_mobile_app/pages/repositories/repo.page.dart';
import 'package:http/http.dart' as http;

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  String query;
  TextEditingController queryTextEditingController =
      new TextEditingController();
  dynamic data;
  int currentPage = 0;
  int totalPages = 0;
  int pageSize = 20;
  bool notVisible = false;
  List<dynamic> items = [];

  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    print("Building page");
    return Scaffold(
        appBar: AppBar(
          title: Text("Users => ${query} => ${currentPage} / ${totalPages}"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      style: TextStyle(fontSize: 22),
                      controller: queryTextEditingController,
                      /* onChanged: (value){
                      setState(() {
                        this.data = null;
                        this.items = [];
                        this.currentPage = 0;
                        this.query = value;
                        this._search(query);
                      });
                    }, */
                      obscureText: notVisible,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          // icon: Icon(Icons.logout),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                notVisible = !notVisible;
                              });
                            },
                            icon: Icon((notVisible == true)
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          hintText: "User Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xff5e2750),
                              ))),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      this.data = null;
                      this.items = [];
                      this.currentPage = 0;
                      this.query = queryTextEditingController.text;
                      this._search(query);
                    });
                  },
                  icon: Icon(
                    Icons.search,
                    color: Color(0xff5e2750),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                        height: 2,
                        color: Color(0xff5e2750),
                      ),
                  /* separatorBuilder: (context, index) {
                  return Divider();
                }, */
                  controller: scrollController,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GitRepositoriesPage(
                                      userName: items[index]['login'],
                                      avatarUrl: items[index]['avatar_url'],
                                    )));
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(items[index]['avatar_url']),
                                radius: 30,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text("${items[index]['login']}"),
                            ],
                          ),
                          CircleAvatar(
                            child: Text("${items[index]['score']}"),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (currentPage < totalPages) {
          setState(() {
            ++currentPage;
            this._search(query);
          });
        }
      }
    });
  }

  _search(String query) {
    var uri =
        'https://api.github.com/search/users?q=${query}&per_page=${pageSize}&page=${currentPage}';
    print(uri);
    http.get(Uri.parse(uri)).then((response) {
      setState(() {
        this.data = json.decode(response.body);
        this.items.addAll(this.data['items']);
        if (data['total_count'] % pageSize == 0) {
          this.totalPages = data['total_count'] ~/ pageSize;
        } else {
          this.totalPages = (data['total_count'] / pageSize).floor() + 1;
        }
      });
    }).catchError((err) {
      print(err);
    });
  }
}
