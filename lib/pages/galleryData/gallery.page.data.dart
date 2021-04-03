import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GalleryDataPage extends StatefulWidget {
  String keyword;

  GalleryDataPage({this.keyword});

  @override
  _GalleryDataPageState createState() => _GalleryDataPageState();
}

class _GalleryDataPageState extends State<GalleryDataPage> {
  int currentPage = 1; // la première page c'est 1 pout cette API
  int pageSize = 10;
  int totalPages;
  List<dynamic> hits = [];
  dynamic galleryData;
  ScrollController _scrollController=new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.keyword}, Page ${currentPage} / ${totalPages}"),
        ),
        body: (galleryData == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: (galleryData == null ? 0 : hits.length),
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 10, right: 10,),
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                hits[index]['tags'],
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          color: Color(0xff5e2750),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10,),
                        child: Card(
                          child: Image.network(
                            hits[index]['webformatURL'],
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Divider(color: Colors.grey,thickness: 2,),
                    ],
                  );
                },
              )));
  }

  getData() {
    var uri = 'https://pixabay.com/api/?key=5832566-81dc7429a63c86e3b707d0429&q=${widget.keyword}&page=${currentPage}&per_page=${pageSize}';
    print(uri);
    http.get(Uri.parse(uri)).then((response) {
      setState(() {
        galleryData = json.decode(response.body);
        hits.addAll(galleryData['hits']);
        if(galleryData['totalHits'] % pageSize == 0){
          totalPages = galleryData['totalHits'] ~/ pageSize;
        } else {
          totalPages = 1 + (galleryData['totalHits'] / pageSize).floor();
        }
        print(hits);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        if(currentPage < totalPages) {
          ++currentPage;
          this.getData();
        }
      }
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
}
