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
  //data\wallpapers\staticBackgrounds\night_peizazh_noch_temnii_art.jpeg
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/night_peizazh_noch_temnii_art.jpeg",
    type: "static"
  ),
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/night_peizazh_noch_temnii_art.jpeg",
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



class Static extends StatefulWidget {
  //const MyWidget({super.key});
  @override
  _StaticState createState() => _StaticState();
}

class _StaticState extends State<Static> {

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

  
//ok so lists are initilized like this when growable?
  List<TypesDisplay> wallDisp = [];
  //THIS WHOLE FUNCTION IF IT WORKS CAN BE DUPLICAYTED FOR DYNAMIC/STATIC BUTTONS

  getStaticWalls() async{
    List<TypesDisplay> OGList = []; 
    OGList.addAll(_wallpaper);
    if(OGList.isNotEmpty){
      List<TypesDisplay> newListResult = []; 
      OGList.forEach((element) {
      if(element.type.contains("static")){
        newListResult.add(element);
        //print(element);
      }
    });
    setState(() {
      wallDisp.clear();
      wallDisp.addAll(newListResult);
    });
    //print("object");
    //print(searchDisp);
    return;
    }else{
      setState(() {
      wallDisp.clear();
      wallDisp.addAll(OGList);
      });
    }
  }
  
   @override
   void initState(){
    getStaticWalls();
    super.initState();
   }
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
                    
                  }),
                  child: Container(
                    //height: 100,
                    decoration: BoxDecoration(
                      //color: Colors.amber,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        scale: 1.5,
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
