//import 'dart:html';
//import 'dart:html';
import 'dart:io';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:samapp/screens/dynamic.dart';
import 'package:samapp/screens/search.dart';
import 'package:samapp/screens/static.dart';
import 'package:samapp/screens/wallView.dart';
import 'package:samapp/screens/wallViewDynamic.dart';
import 'package:samapp/screens/widgets/widgets.dart';
import 'package:video_player/video_player.dart';
//import 'package:live_photos/live_photos.dart';
//import '../imagesDisplay/typesDisplay.dart';

//dude I tried really hard to make this automatic....manual wa the only way I could figure it out
//THE IMAGE PATH LEADS TO GIFS BUT THE LINKS NEED TO BE MP4!!

List<TypesDisplay> _wallpaper = [
  //data\wallpapers\staticBackgrounds\night_peizazh_noch_temnii_art.jpeg
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/night_peizazh_noch_temnii_art.jpeg",
    type: "static",
    link: "https://mobimg.b-cdn.net/v3/fetch/5d/5d193bfff6560f03e7bc2ecfeadef5f4.jpeg?h=900&r=0.5"
  ),
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/night_peizazh_noch_temnii_art.jpeg",
    type: "static",
    link: "https://mobimg.b-cdn.net/v3/fetch/5d/5d193bfff6560f03e7bc2ecfeadef5f4.jpeg?h=900&r=0.5"
  ),
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/night lantern art.jpeg",
    type: "static",
    link: "https://mobimg.b-cdn.net/v3/fetch/96/960badd134bffdb7e4605b605ab38c40.jpeg?h=900&r=0.5"
  ),
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/night lantern art.jpeg",
    type: "static",
    link: "https://mobimg.b-cdn.net/v3/fetch/96/960badd134bffdb7e4605b605ab38c40.jpeg?h=900&r=0.5"
  ),
  TypesDisplay(
    wallPath: "data/wallpapers/dynamicBackgrounds/circles.gif",
    type: "dynamic",
    link: "https://static.videezy.com/system/resources/previews/000/042/042/original/Ramdom_Lines_x264.mp4"
  ),
  TypesDisplay(
    wallPath: "data/wallpapers/dynamicBackgrounds/river view.gif",
    type: "dynamic",
    link: "https://www.desktophut.com/files/1657547800-1657547800-rocky-waterfalls-phone-wallpaper-to-iphone-and-android.mp4"
  ),
]; 

//these are global
// final Directory imagePathStatic = new Directory('data/wallpapers/staticBackgrounds/');
// final Directory imagePathDynamic = new Directory('data/wallpapers/dynamicBackgrounds/');
//String directDynamic;

// List imagesDispDynamic = imagesDispDynamic;
// List imagesDispStatic = imagesDispStatic;

class Home extends StatefulWidget {
  //const MyWidget({super.key});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // late File images;
  // final imagePicker = ImagePicker();
  //List<TypesDisplay> typesDisp = List<TypesDisplay>.empty();

  //makes the initial state to get the images for the types
  // @override
  // void initialState(){
  //   //getDispBox();
  //   super.initState();

  // }
  TextEditingController searchCont = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Color pinkish = const Color(15505607);
    return Scaffold(
      appBar: AppBar(
        title: Background_Bois(),
        elevation: 0.0,
      ),
      //this makes the title bar and search bar
      body: Container(
        child: Column(
          children: <Widget>[
          Container( 
            color: const Color(0xFFEC98C7),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: <Widget>[
              Expanded(
                child: TextField(
                  controller: searchCont,
                  decoration: InputDecoration(
                  hintText: "Search"
                ),
                ),
              ),
              GestureDetector(
                onTap:() {
                  Navigator.push(context, 
                    MaterialPageRoute(
                    builder: (context) => Search(
                      searchedItem: searchCont.text,
                    ),
                  ));
                },
                child: Icon(Icons.search),
              ),
            ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 70,
            //margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //STATIC IMAGE 
                Expanded(
                  child: 
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, 
                          MaterialPageRoute(
                          builder: (context) => Static(),
                  ));
                        },
                        child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('data/display/static.jpg', height: 60, width: 100,  fit: BoxFit.cover, alignment: Alignment.center,) 
                        ),
                      ),
                      Container(
                        height: 60, width: 100,
                        child: const Positioned.fill(
                          child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("Static", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),),
                          )
                        ),
                      )
                    ],
                  )
                ),
                //DYNAMIC IMAGE
                Expanded(
                  child: 
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, 
                          MaterialPageRoute(
                          builder: (context) => Dynamic(),
                  ));
                        },
                        child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('data/display/dynamicCat', height: 60, width: 100, fit: BoxFit.cover, alignment: Alignment.center,) 
                        ),
                      ),
                      Container(
                        height: 60, width: 100,
                        child: const Positioned.fill(child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text("Dynamic", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),),
                          )
                        ),
                      )
                    ],
                  )
                ),
              ],
            ),
          ),


          //this should be the place where images are displayed
          Expanded(
            //padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //shrinkWrap:true,
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
              ), 
              itemBuilder: (context, index) {
                return RawMaterialButton(
                  onPressed: (() {
                    //String thing = _wallpaper[index].wallPath;
                    if(_wallpaper[index].type == "dynamic"){
                      Navigator.push(context, MaterialPageRoute(
                      builder: (context) => WallViewDynamic(wallPath: _wallpaper[index].wallPath, wallLink: _wallpaper[index].link))
                      );
                    }else{
                      Navigator.push(context, MaterialPageRoute(
                      builder: (context) => WallView(wallPath: _wallpaper[index].wallPath, wallLink: _wallpaper[index].link))
                      );
                    }
                    
                  }),
                  child: Container(
                    //height: 100,
                    decoration: BoxDecoration(
                      //color: Colors.amber,
                      borderRadius: BorderRadius.circular(5),
                      //allows gif not mp4
                      image: DecorationImage(
                        scale: 1.5,
                        //image: _wallpaper.type == "dynamic" ? new Container() : new Container()
                        image: AssetImage(_wallpaper[index].wallPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              itemCount: _wallpaper.length,
              ),
            ),
          ),


          //END IMAGE LAYOUT
        ],
      ),
      ),
    );
  }
}


//honestly... I REALLY wanted to find a way to NOT hardcode this....but I cannot seem to find a way

//IN TYPESDISPLAY.DART
class TypesDisplay{
  final String wallPath;
  //this is static or dynamic
  final String type;
  final String link;
  TypesDisplay({required this.wallPath, required this.type, required this.link});
}
