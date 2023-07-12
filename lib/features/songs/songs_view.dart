import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:music_player/music_player.dart';


import 'package:seponewenoapp/features/home/widgets/backgroundApp.dart';
import 'package:seponewenoapp/features/player/widgets/marquee_text.dart';
import 'package:seponewenoapp/features/songs/controls.dart';
import 'package:seponewenoapp/features/songs/downloads.dart';

class SongsView extends StatefulWidget {
  final String url;
  final String urlImage;

  const SongsView( this.url, this.urlImage );
  @override

  SongsviewState createState() => SongsviewState();

}


class SongsviewState extends State<SongsView> {

  MusicPlayer musicPlayer;
  List<String> title = List();
  List<String> image = List();
  List<String> link = List();
  String artist;
  bool _play = false;


  void _getData() async {
    final response = await http.get(widget.url);
    dom.Document document = parser.parse(response.body);
    final elements = document.querySelectorAll('div.contentLinksFicha');
    final element2= document.querySelectorAll('div.personalIMG');
    final linkElemnt=document.querySelectorAll('div.contentLinksFicha');
    artist = document.getElementsByTagName('strong')[0].innerHtml.toString();
    setState(() {
      title = elements
          .map((element) =>
      element.getElementsByTagName("a")[0].innerHtml)
          .toList();
      image = element2
          .map((element) =>
      element.getElementsByTagName("img")[0].attributes['src'])
          .toList();
      link = linkElemnt
          .map((element) =>
      element.getElementsByTagName("a")[0].attributes['href'])
          .toList();
    });
  }


  @override
  // ignore: must_call_super
  void initState() {
    _getData();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    musicPlayer = MusicPlayer();
  }

  _clearspace(String value){
    return value.replaceAll("  ", "");
  }

  _amp(String value){
    return value.replaceAll("&amp;", "&");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Stack(children: <Widget>[
            BackgroudHome(),
            SafeArea(
              child: Container(
                padding: EdgeInsets.only( left: 7.0, right: 7.0, top: 10.0 ),
                child: Stack(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only( top: 5.0, bottom: 5.0, right: 5.0, left: 10.0),
                            width : 130,
                            height: 130,
                            decoration: BoxDecoration(
                                border: Border.all( color: Colors.white, width: 0.6),
                                borderRadius: BorderRadius.circular(65.0),
                              image: DecorationImage( image: NetworkImage(widget.urlImage??"Cargando...",) )
                            ),
                        ),
                        Container(
                          width: 150,
                          height: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 5.0),
                                child: MarqueeWidget(
                                  direction: Axis.horizontal,
                                  child: Text(
                                    (_amp(artist??"Cargando...")),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),),
                              ),
                              SizedBox(height: 5.0,),
                              Container( padding: EdgeInsets.only(left: 5.0), child: Text("Canciones: "+ title.length.toString(), style: TextStyle( fontSize: 16.0 ),)),
                              SizedBox(height: 5.0,),
                            ],
                          ),
                        ),
                      ],
                    ),
                    title.length == 0 ? Center(child: Text("Cargando")): Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only( top: 150.0 ),
                            child: ListView.builder(
                                itemCount: title.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child:
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(30.0),
                                                  border: Border.all( color: Colors.white, width: 0.7)
                                              ),
                                              padding: EdgeInsets.only( left: 5.0, right: 5.0, top: 5.0 ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: <Widget>[
                                                  MarqueeWidget(
                                                    direction: Axis.horizontal,
                                                    child: Text(
                                                      _clearspace(_amp(title[index])),
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.normal,
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                      ),
                                                    ),),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: <Widget>[
                                                      Container(
                                                        child: OutlineButtonClass(
                                                            title[index],
                                                            link[index],
                                                            "SePoneWeno",
                                                            _clearspace(_amp(artist)),
                                                            widget.urlImage ),
                                                      ),
                                                      Container(
                                                          child: OutlineButtonDownload(title[index], link[index])
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 15),
                                                ],
                                              ),
                                            ),
                                  );
                                },
                            ),
                          ),
                        ),
                      ],
                    ),],
                ),
              ),
            ),
          ],
          ),
        ),
    );
  }
}