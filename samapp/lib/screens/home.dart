import 'dart:html';

import 'package:flutter/material.dart';
import 'package:samapp/screens/widgets/widgets.dart';

class Home extends StatefulWidget {
  //const MyWidget({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //makes the initial state to get the images for the types
  @override
  void initialState(){
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
          //TypeSection()
        ],
      ),
      ),
    );
  }
}

class TypeSection extends StatelessWidget {
  final String imageUrl, types;
  TypeSection({required this.types, required this.imageUrl});
  
  @override
  Widget build(BuildContext context){
    return Container(
      child: Stack(children: <Widget>[
        Container(
          child: Image.network(imageUrl),
        ),
        Container(
          child: Text(types),
          ),
      ],
      ),
    );
  }

}