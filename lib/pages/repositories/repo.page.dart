import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GitRepositoriesPage extends StatefulWidget {
  String userName;
  String avatarUrl;

  GitRepositoriesPage({this.userName, this.avatarUrl});

  @override
  _GitRepositoriesPageState createState() => _GitRepositoriesPageState();
}

class _GitRepositoriesPageState extends State<GitRepositoriesPage> {
  dynamic dataRepositories;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadRepositories();
  }

  void loadRepositories() async{
    String url = "https://api.github.com/users/${widget.userName}/repos";
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      setState(() {
        dataRepositories = json.decode(response.body);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Repositories"),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.avatarUrl),
            radius: 30,
          )
        ],
      ),
      body: Center(
        child: ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Column(
                children: [
                  Text("ID : ${dataRepositories[index]['id']}"),
                  SizedBox(height: 10,),
                  Text("Name : ${dataRepositories[index]['name']}"),
                  SizedBox(height: 10,),
                  Text("Language : ${dataRepositories[index]['language']}"),
                  SizedBox(height: 10,),
                  Text("Size : ${dataRepositories[index]['size']}"),
                ],
              ),
            ),
            separatorBuilder: (context, index) => Divider(height: 2, color: Color(0xff5e2750),),
            itemCount: dataRepositories == null ? 0 : dataRepositories.length
        ),
      ),
    );
  }
}