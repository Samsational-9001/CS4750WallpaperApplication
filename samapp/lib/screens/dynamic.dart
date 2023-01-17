//import 'dart:html';
//import 'dart:html';
import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:samapp/screens/search.dart';
import 'package:samapp/screens/wallView.dart';
import 'package:samapp/screens/wallViewDynamic.dart';
import 'package:samapp/screens/widgets/widgets.dart';
//import '../imagesDisplay/typesDisplay.dart';

//dude I tried really hard to make this automatic....manual wa the only way I could figure it out
List<TypesDisplay> _wallpaper = [
  //data\wallpapers\staticBackgrounds\night_peizazh_noch_temnii_art.jpeg
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/night_peizazh_noch_temnii_art.jpeg",
    type: "static",
    link: "https://mobimg.b-cdn.net/v3/fetch/5d/5d193bfff6560f03e7bc2ecfeadef5f4.jpeg?h=900&r=0.5"
  ),
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/mountain-lake-nature-gora-ozero-ptitsa-nebo-gorizont-106821.jpeg",
    type: "static",
    link: "https://mobimg.b-cdn.net/v3/fetch/19/1901860665ae1ad2d545fcc347cc9b40.jpeg?h=900&r=0.5"
  ),
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/night lantern art.jpeg",
    type: "static",
    link: "https://mobimg.b-cdn.net/v3/fetch/96/960badd134bffdb7e4605b605ab38c40.jpeg?h=900&r=0.5"
  ),
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/road-red-trees-nature-doroga-povorot-derevya-krasnii-gora-peizazh-61856.jpeg",
    type: "static",
    link: "https://mobimg.b-cdn.net/v3/fetch/81/81b69b0cee484911477757953c498edc.jpeg?h=900&r=0.5"
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
  TypesDisplay(
    wallPath: "data/wallpapers/dynamicBackgrounds/cool-storm-center-free-live-phone-wallpaper.gif",
    type: "dynamic",
    link: "https://www.desktophut.com/files/1657547616-1657547616-cool-storm-center-free-live-phone-wallpaper.mp4"
  ),
  TypesDisplay(
    wallPath: "data/wallpapers/dynamicBackgrounds/Cool Lunar Landscape Free Live Phone Wallpaper.gif",
    type: "dynamic",
    link: "https://www.desktophut.com/files/1657546942-1657546942-cool-lunar-landscape-free-live-phone-wallpaper.mp4"
  ),
]; 

class Dynamic extends StatefulWidget {
  //const MyWidget({super.key});
  @override
  _DynamicState createState() => _DynamicState();
}

class _DynamicState extends State<Dynamic> {

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

  getDynamicWalls() async{
    List<TypesDisplay> OGList = []; 
    OGList.addAll(_wallpaper);
    if(OGList.isNotEmpty){
      List<TypesDisplay> newListResult = []; 
      OGList.forEach((element) {
      if(element.type.contains("dynamic")){
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
    getDynamicWalls();
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
                    if(wallDisp[index].type == "dynamic"){
                      Navigator.push(context, MaterialPageRoute(
                      builder: (context) => WallViewDynamic(wallPath: wallDisp[index].wallPath, wallLink: wallDisp[index].link))
                      );
                    }else{
                      Navigator.push(context, MaterialPageRoute(
                      builder: (context) => WallView(wallPath: wallDisp[index].wallPath, wallLink: wallDisp[index].link))
                      );
                    }
                  }),
                  child: Container(
                    //height: 100,
                    decoration: BoxDecoration(
                      //color: Colors.amber,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        scale: 1.5,
                        image: AssetImage(wallDisp[index].wallPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              itemCount: wallDisp.length,
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
  final String link;
  TypesDisplay({required this.wallPath, required this.type, required this.link});
}
