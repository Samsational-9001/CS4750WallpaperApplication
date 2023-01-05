import 'package:flutter/material.dart';
import 'package:samapp/screens/widgets/widgets.dart';

class Home extends StatefulWidget {
  //const MyWidget({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Background_Bois(),
        elevation: 0.0,
      ),
      body: Container(child: Column(children: <Widget>[
          Container( 
            color: Colors.pink,
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
          )
        ],
      ),
      ),
    );
  }
}