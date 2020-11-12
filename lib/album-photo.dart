import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


// void main()=> runApp(MaterialApp(
//   theme: ThemeData(backgroundColor: Colors.deepOrange),
//   home: AlbumPhoto() ,
// ));

class AlbumPhoto extends StatefulWidget {
  @override
  _AlbumPhotoState createState() => _AlbumPhotoState();
}

class _AlbumPhotoState extends State<AlbumPhoto> {
  List <dynamic> listPhoto;
  var photoData;
  var lesVues; 
  var lesLikes;
  var telecharge;

  @override
  void initState() {
    
    super.initState();
    this.getGallerie();

  }
 
 void getGallerie() {
    // String cle;
    String url =
        "https://pixabay.com/api/?key=18694456-b05aabd7bb1309f4981db7734&q=Madrid&page=1&per_page=15"; 
    http.get(url).then((response) {
      this.photoData = json.decode(response.body);
      this.listPhoto = this.photoData['hits'];
      this.lesLikes = this.photoData['likes'];
      this.telecharge = this.photoData['downloads'];
    }).catchError((error) {
      print(error);
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text('pixabay isicom'), backgroundColor: Colors.deepOrange),
        body: (this.photoData == null
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: this.photoData == null ? 0 : this.listPhoto.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textDirection: TextDirection.ltr,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text(listPhoto[index]['tags']),
                        ),
                    
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Image.network(listPhoto[index]['webformatURL']),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                        child: Text('j aime : '+('${listPhoto[index]['likes']}').toString(), style: 
                        TextStyle(color: Colors.blue,
                        textBaseline: TextBaseline.alphabetic),
                        textAlign: TextAlign.left,
                        ),
                      ),
                      ),
                      Container(
                        child: Text(' les vues : '+('${listPhoto[index]['views']}').toString(),
                                     style: TextStyle(color: Colors.amberAccent),
                                     textAlign: TextAlign.justify,
                                     ),
                      ),
                      Container(
                        child: Text('telechargements :'+('${listPhoto[index]['downloads']}').toString()),
                      )
                    ],
                  );
                }))
                );
  }
}
