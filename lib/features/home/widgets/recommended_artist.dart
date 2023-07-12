import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:seponewenoapp/features/songs/songs_view.dart';


class RecommendedArtists extends StatefulWidget {
  @override
  _RecommendedArtistsState createState() => _RecommendedArtistsState();
}

class _RecommendedArtistsState extends State<RecommendedArtists> {


  List<String> name = List();
  List<String> image = List();
  List<String> link = List();


  // String linkimage;

  void getDataArtist() async {
    final response = await http.get('https://www.seponeweno.nat.cu/');
    dom.Document document = parser.parse(response.body);
    final elements = document.querySelectorAll('div.col-md-3.content-grid');
    setState(() {
      name = elements
          .map((element) =>
      element.getElementsByClassName("button play-icon popup-with-zoom-anim")[0].innerHtml)
          .toList();
      image = elements
          .map((element) =>
      element.getElementsByTagName("img")[0].attributes['src'])
          .toList();
      link = elements
          .map((element) =>
      element.getElementsByTagName("a")[0].attributes['href'])
          .toList();
    }

    );
  }



  @override
  // ignore: must_call_super
  void initState() {
    getDataArtist();
  }

  _amp(String value){
    return value.replaceAll("&amp;", "&");
  }




  @override
  Widget build(BuildContext context) {
    return name.length == 0 ? Center(
        child:
        Container(width: 250, height: 250, child: Text("Cargando...", style: TextStyle( color: Colors.white54, fontSize: 45 ),))) :
    Column(
      children: <Widget>[
        SizedBox( height: 5.0, ),
        Container(
          padding: EdgeInsets.only( top: 3.0 ),
          width: double.infinity,
          height: 250.0,
          child: name.length == 0 ? Center(child: Text("Cargando...", style: TextStyle( color: Colors.white54, fontSize: 45 ),)) :
          Swiper(
            layout: SwiperLayout.STACK,
            itemWidth: 245,
            itemCount: name.length,
            autoplay: true,
            loop: true,
            // scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index){
              return InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SongsView('https://www.seponeweno.nat.cu/'+link[index], 'https://www.seponeweno.nat.cu/'+image[index])),
                  );
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 230,
                      height: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage( fit: BoxFit.cover, image: NetworkImage('https://www.seponeweno.nat.cu/'+image[index])),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: LinearGradient(
                              begin: FractionalOffset(0.0, 0.4),
                              end: FractionalOffset(0.0, 0.8),
                              colors: [
                                Colors.black12,
                                Colors.black,
                              ]
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Flexible(
                              child: Text(_amp(name[index]),
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                  overflow: TextOverflow.ellipsis),
                            ),
                            SizedBox(height: 8.0,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
