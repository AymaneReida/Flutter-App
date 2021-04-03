import 'package:flutter/material.dart';
import 'package:git_mobile_app/pages/galleryData/gallery.page.data.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  String keyword = "";
  TextEditingController keywordTextEditingController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${keyword}")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                style: TextStyle(fontSize: 22),
                decoration: InputDecoration(
                    hintText: 'Tap a place',
                    contentPadding: EdgeInsets.all(10),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          keywordTextEditingController.text = "";
                          this.keyword = "";
                        });
                      },
                      icon: Icon(Icons.clear),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          width: 1,
                          color: Color(0xff5e2750),
                        ))),
                onChanged: (value) {
                  setState(() {
                    this.keyword = value;
                  });
                },
                controller: keywordTextEditingController,
                onSubmitted: (value) {
                  this.keyword = value;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GalleryDataPage(
                                keyword: keyword,
                              )));
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GalleryDataPage(
                                keyword: keyword,
                              )));
                  keywordTextEditingController.text = "";
                },
                color: Color(0xff5e2750),
                // textColor: Colors.white,
                child: Text(
                  'Get Images',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
