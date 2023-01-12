//import 'dart:html';
//import 'dart:html';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:samapp/screens/search.dart';
import 'package:samapp/screens/widgets/widgets.dart';
//import '../imagesDisplay/typesDisplay.dart';

//dude I tried really hard to make this automatic....manual wa the only way I could figure it out
List<TypesDisplay> _wallpaper = [
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/night_peizazh_noch_temnii_art.jpg",
    type: "static"
  ),
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/night_peizazh_noch_temnii_art.jpg",
    type: "static"
  ),
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/staticExample.jpg",
    type: "static"
  ),
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/staticExample.jpg",
    type: "static"
  ),
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/staticExample.jpg",
    type: "static"
  ),
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/staticExample.jpg",
    type: "static"
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
                      ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('data/display/static.jpg', height: 60, width: 100,  fit: BoxFit.cover, alignment: Alignment.center,) 
                      ),
                      Container(
                        height: 60, width: 100,
                        child: Positioned.fill(
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
                      ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('data/display/dynamicCat', height: 60, width: 100, fit: BoxFit.cover, alignment: Alignment.center,) 
                      ),
                      Container(
                        height: 60, width: 100,
                        child: Positioned.fill(child: Align(
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
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ), 
              itemBuilder: (context, index) {
                return RawMaterialButton(
                  onPressed: (() {
                    
                  }),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
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
  TypesDisplay({required this.wallPath, required this.type});
}
