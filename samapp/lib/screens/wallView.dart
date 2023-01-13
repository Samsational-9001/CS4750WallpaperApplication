import 'dart:typed_data';
import 'dart:io' show Platform;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class WallView extends StatefulWidget {
  //const WallView({super.key});
  final String wallPath;
  WallView({required this.wallPath});
  @override
  State<WallView> createState() => _WallViewState();
}

class _WallViewState extends State<WallView> {
  var wallPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: Image.asset(
            widget.wallPath, fit: BoxFit.cover,
          ),
        ),
        //set wallpaper button
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
            GestureDetector(
              onTap: () {
                _save();
                //Navigator.pop(context);
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/2,
                    color: Color(0xff1C1B1B).withOpacity(0.6),
                  ),
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/2,
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(children: <Widget>[
                      Text("Set This Wallpaper", style: TextStyle(color: Colors.black, fontSize: 18),),
                      Text("Image will need space in Gallery", style: TextStyle(color: Colors.black, fontSize: 10),),
                    ],),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5,),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text("Cancel", style: TextStyle(color: Colors.amber),)
              ),
            SizedBox(height: 40,),
          ],),
          ),
      ],
      ),
    );
  }
//this saves image into gallery
  _save() async {
    if(Platform.isAndroid){
      await _askPermission();
    }
    var response = await Dio().get(widget.wallPath,
        options: Options(responseType: ResponseType.bytes));
    final result =
    await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async {
    if(Platform.isIOS){
      //Map<PermissionGroup, PermissionStatus> permissions = 
      await PermissionHandler().requestPermissions([PermissionGroup.photos]);
    }else{
      PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
    }
  }

  
}