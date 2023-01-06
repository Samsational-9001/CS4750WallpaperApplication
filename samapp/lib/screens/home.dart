//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:samapp/screens/widgets/widgets.dart';
import '../data/database.dart';
import '../imagesDisplay/typesDisplay.dart';

class Home extends StatefulWidget {
  //const MyWidget({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<TypesDisplay> typesDisp = List<TypesDisplay>.empty();

  //makes the initial state to get the images for the types
  @override
  void initialState(){
    typesDisp = getDispBox();
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
      body: Container(child: Column(children: <Widget>[
          Container( 
            color: const Color(0xFFEC98C7),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: <Widget>[
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                  hintText: "Search"
                ),
                ),
              ),
              Icon(Icons.search)
            ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 100,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30),
              itemCount: typesDisp.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder:  (context, index) {
                  return TypeSection(
                    type: typesDisp[index].type,
                    imageUrl: typesDisp[index].imageUrl
                  );
              }),
          )
        ],
      ),
      ),
    );
  }
}

class TypeSection extends StatelessWidget {
  String type, imageUrl;
  TypeSection({required this.type, required this.imageUrl});
  
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      child: Stack(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(imageUrl, height:70, width: 100, fit: BoxFit.cover,),
        ),
        Container(
          color: Colors.purple,
          height:70, 
          width: 100,
          alignment: Alignment.center,
          child: Text(type, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),),
          ),
      ],
      ),
    );
  }

}