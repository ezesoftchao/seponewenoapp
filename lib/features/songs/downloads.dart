import 'package:flutter/material.dart';


import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;

import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:music_player/music_player.dart';


class OutlineButtonDownload extends StatefulWidget {

  final String filename;
  final String filelink;

  const OutlineButtonDownload( this.filename, this.filelink );

  @override
  _OutlineButtonDownloadState createState() => _OutlineButtonDownloadState();
}

class _OutlineButtonDownloadState extends State<OutlineButtonDownload> {


  MusicPlayer musicPlayer;
  List<String> top10link = List();
  List<String> top10song = List();
  String filenamesong = "";
  final Dio _dio = Dio();
  String _fileUrl = "";
  String _fileName = "Hola.mp3";
  String progress = "-";

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;



  @override
  void initState() {
    super.initState();

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();
    final initSettings = InitializationSettings(android, iOS);

    flutterLocalNotificationsPlugin.initialize(initSettings, onSelectNotification: _onSelectNotification);
  }


  Future<void> _onSelectNotification(String json) async {
    final obj = jsonDecode(json);

    if (obj['isSuccess']) {
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Error'),
          content: Text('${obj['error']}'),
        ),
      );
    }
  }

  Future<void> _showNotification(Map<String, dynamic> downloadStatus) async {
    final android = AndroidNotificationDetails(
        'channel id',
        'channel name',
        'channel description',
        priority: Priority.High,
        importance: Importance.Max
    );
    final iOS = IOSNotificationDetails();
    final platform = NotificationDetails(android, iOS);
    final json = jsonEncode(downloadStatus);
    final isSuccess = downloadStatus['isSuccess'];

    await flutterLocalNotificationsPlugin.show(
        0, // notification id
        isSuccess ? 'Descargado' : 'Fallo',
        isSuccess ? _fileName : 'Error al descargar la canción.',
        platform,
        payload: json
    );
  }

  Future<Directory> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      return await DownloadsPathProvider.downloadsDirectory;
    }

    // in this example we are using only Android and iOS so I can assume
    // that you are not trying it for other platforms and the if statement
    // for iOS is unnecessary

    // iOS directory visible to user
    return await getApplicationDocumentsDirectory();
  }


  Future<bool> _requestPermissions() async {
    var permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);

    if (permission != PermissionStatus.granted) {
      await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    }

    return permission == PermissionStatus.granted;
  }

  void _onReceiveProgress(int received, int total) {
    if (total != -1) {
      setState(() {
        progress = (received / total * 100).toStringAsFixed(0) + "%";
      });
    }
  }

  Future<void> _startDownload(String savePath) async {
    Map<String, dynamic> result = {
      'isSuccess': false,
      'filePath': null,
      'error': null,
    };

    try {
      final response = await _dio.download(
          _fileUrl,
          savePath,
          onReceiveProgress: _onReceiveProgress
      );
      result['isSuccess'] = response.statusCode == 200;
      result['filePath'] = savePath;
    } catch (ex) {
      result['error'] = ex.toString();
    } finally {
      await _showNotification(result);
    }
  }

  Future<void> _download() async {
    _showToast(context);
    final dir = await _getDownloadDirectory();
    final isPermissionStatusGranted = await _requestPermissions();

    if (isPermissionStatusGranted) {
      final savePath = path.join(dir.path, _fileName);
      await _startDownload(savePath);
    } else {
      // handle the scenario when user declines the permissions
    }
  }


  clearspace(String value){
    return value.replaceAll("  ", "");
  }

  _finalnameFile(String value){
    return value.replaceAll("\n", "");
  }


  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      /*borderSide: BorderSide(color: Colors.white),
      highlightedBorderColor: Colors.white,*/
      textColor: Colors.black87,
      color: Colors.yellow,
      onPressed: (){
        _fileUrl = 'https://seponeweno.nat.cu/'+widget.filelink;
        _fileName = _finalnameFile(clearspace(widget.filename)+".mp3");
        if( progress == "-" ){
          // DownloadService( top10song[index], top10link[index] );
          _download();
        }else{
          showToast2(context);
        }
      },
      child:
      Container(
        // padding: EdgeInsets.only( top: 5.0 ),
        child: Column(
          children: <Widget>[
            Text( progress == "-" ? "Descargar" : progress ),
          ],
        ),
      ),
      // Text('Descargar', style: TextStyle(color: Colors.white),)
    );
  }
  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Descargando en ~/Download'),
        action: SnackBarAction(
            label: 'Ocultar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  void showToast2(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Ya hay una descarga en curso'),
        action: SnackBarAction(
            label: 'Ocultar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}