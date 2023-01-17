import 'dart:typed_data';
import 'dart:io' show Directory, File, Platform;
import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:flutter_cache_manager/flutter_cache_manager.dart';
//import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
//import 'package:image_gallery_saver/image_gallery_saver.dart';
//import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart' show PlatformException, rootBundle;
//import 'package:wallpaper_manager_flutter/wallpaper_manager_flutter.dart';
//import 'package:wallpaper_manager/wallpaper_manager.dart';
import 'package:path/path.dart' as Path;

class WallViewDynamic extends StatefulWidget {
  
  //const WallView({super.key});
  final String wallPath;
  final String wallLink;
  WallViewDynamic({required this.wallPath, required this.wallLink});
  @override
  State<WallViewDynamic> createState() => _WallViewDynamicState();
}

class _WallViewDynamicState extends State<WallViewDynamic> {
  late String result;
  //String LINK = "https://mobimg.b-cdn.net/v3/fetch/5d/5d193bfff6560f03e7bc2ecfeadef5f4.jpeg?h=900&r=0.5";

  @override
   void initState(){
    super.initState();
   }
   

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
              onTap: () async{
                //I only want home screen changed
                //....as you can see from the amount of comments I struggled to get this to work
                try{
                
                  // File image = await getImageFileFromAssets(widget.wallPath);

                  // final extDir = await getExternalStorageDirectory();
                  // // Path of file
                  // final myImagePath = '${extDir?.path}/Walls';

                  // Create directory inside where file will be saved
                  // await Directory(myImagePath).create();
                  // print(myImagePath);
                  // print(image);

                // File copied to ext directory.
                //File newImage = await image.copy("$myImagePath/${Path.basename(widget.wallPath)}");
                
                //print(newImage.path);
                  //await new Directory().create();
                  // final file = File('${(await getTemporaryDirectory()).path}/'+widget.wallPath);
                  // print(file);
                  // await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
                  var file = await DefaultCacheManager().getSingleFile(widget.wallLink);
                  int location = AsyncWallpaper.HOME_SCREEN;
                  result = await AsyncWallpaper.setLiveWallpaper(
                    filePath: file.path, )
                    ? 'Wallpaper set'
                    : 'Failed to get wallpaper.';
                  //await AsyncWallpaper.setWallpaperFromFile(filePath: wallPathFin, );
                } on PlatformException {
                  result = "Failed to get wallpapaer";
                }
                print(result);
                //_save();
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
                    height: 60,
                    width: MediaQuery.of(context).size.width/2,
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(children: <Widget>[
                      Text("Set This Wallpaper", style: TextStyle(color: Colors.black, fontSize: 18),),
                      Text("Image will need space in Gallery", style: TextStyle(color: Colors.black, fontSize: 10),),
                      Text("Note: Live wallpaper may not work on your device", style: TextStyle(color: Colors.black, fontSize: 10),),
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

}