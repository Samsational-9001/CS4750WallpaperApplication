import 'package:flutter/material.dart';
import 'package:samapp/screens/widgets/widgets.dart';

List<TypesDisplay> _wallpaper = [
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
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/staticExample.jpg",
    type: "static"
  ),
  TypesDisplay(
    wallPath: "data/wallpapers/staticBackgrounds/staticExample.jpg",
    type: "static"
  ),
]; 



class Search extends StatefulWidget {
  //const Search({super.key});
  final String searchedItem;
  Search({required this.searchedItem});
  @override
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
      }
    });
    setState(() {
      searchDisp.clear();
      searchDisp.addAll(searchListResult);
    });
    return;
    }else{
      setState(() {
      searchDisp.clear();
      searchDisp.addAll(searchList);
      });
    }
  }
  
  @override
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
                        image: AssetImage(searchDisp[index].wallPath),
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

class TypesDisplay{
  final String wallPath;
  //this is static or dynamic
  final String type;
  TypesDisplay({required this.wallPath, required this.type});
}