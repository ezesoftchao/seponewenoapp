import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/music_player.dart';
import 'package:seponewenoapp/features/player/player_view.dart';

class OutlineButtonClass extends StatefulWidget {
  final String namesong;
  final String linksong;
  final String album;
  final String artist;
  final String image;

  const OutlineButtonClass( this.namesong, this.linksong, this.album, this.artist, this.image );

  @override
  _OutlineButtonClassState createState() => _OutlineButtonClassState();
}

class _OutlineButtonClassState extends State<OutlineButtonClass> {
  MusicPlayer musicPlayer;
  bool _play = false;


  @override
  // ignore: must_call_super
  void initState(){
    initPlatformState();

  }

  Future<void> initPlatformState() async {
    musicPlayer = MusicPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      /*borderSide: BorderSide(color: Colors.white),
      highlightedBorderColor: Colors.white,*/
      textColor: Colors.white,
      color: Colors.yellow,
      onPressed: (){
        Get.to(Player());
        // if(_play == false){
        //   musicPlayer.play(MusicItem(
        //     trackName: widget.namesong.replaceAll("  ", ""),
        //     albumName: widget.album,
        //     artistName: widget.artist,
        //     url: 'https://seponeweno.nat.cu/'+widget.linksong,
        //     coverUrl: widget.image,
        //     duration: Duration(seconds: 255),
        //   ));
        //   setState(() {
        //     _play = true;
        //   });
        // }else{
        //   musicPlayer.pause();
        //   setState(() {
        //     _play = false;
        //   });
        // }

      },
      child: Container(
          child:
          Icon( _play ? Icons.stop : Icons.play_arrow, color: Colors.black87, )
        // Text('Reproducir', style: TextStyle(color: Colors.white),)
      ),
    );
  }
}
