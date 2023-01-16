import 'package:flutter/material.dart';
import 'package:samapp/screens/wallView.dart';
import 'package:samapp/screens/wallViewDynamic.dart';
import 'package:samapp/screens/widgets/widgets.dart';

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
]; 

class Search extends StatefulWidget {
  //const Search({super.key});
  final String searchedItem;
  Search({required this.searchedItem});
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

//ok so lists are initilized like this when growable?
  List<TypesDisplay> searchDisp = [];
  TextEditingController searchCont = new TextEditingController();
  //THIS WHOLE FUNCTION IF IT WORKS CAN BE DUPLICAYTED FOR DYNAMIC/STATIC BUTTONS

  getSearchedWalls(String searched) async{
    List<TypesDisplay> searchList = []; 
    searchList.addAll(_wallpaper);
    if(searched.isNotEmpty){
      List<TypesDisplay> searchListResult = []; 
      searchList.forEach((element) {
      if(element.wallPath.contains(searched)){
        searchListResult.add(element);
        //print(element);
      }
    });
    setState(() {
      searchDisp.clear();
      searchDisp.addAll(searchListResult);
    });
    //print("object");
    //print(searchDisp);
    return;
    }else{
      setState(() {
      searchDisp.clear();
      searchDisp.addAll(searchList);
      });
    }
  }
  
   @override
   void initState(){
    getSearchedWalls(widget.searchedItem);
    super.initState();
    searchCont.text = widget.searchedItem;
   }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Background_Bois(),
        elevation: 0.0,
      ),
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
                  getSearchedWalls(searchCont.text);
                },
                child: Icon(Icons.search),
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
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: AssetImage(searchDisp[index].wallPath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              itemCount: searchDisp.length,
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}

class TypesDisplay{
  final String wallPath;
  //this is static or dynamic
  final String type;
  final String link;
  TypesDisplay({required this.wallPath, required this.type, required this.link});
}