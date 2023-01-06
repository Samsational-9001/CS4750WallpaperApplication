import '../imagesDisplay/typesDisplay.dart';

List<TypesDisplay> getDispBox(){
  List<TypesDisplay> typesDisp = List<TypesDisplay>.empty();
  TypesDisplay typesDisplay = new TypesDisplay();

  //the static example
  typesDisplay.imageUrl = "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  typesDisplay.type = "Static";
  typesDisp.add(typesDisplay);

  //the dynamic model
  typesDisplay = new TypesDisplay();
  //https://media.giphy.com/media/B0g68d61knrG0/giphy.gif
  typesDisplay.imageUrl = "https://publicdomainvectors.org/photos/paisleySimple_nobg.png";
  typesDisplay.type = "Dynamic";
  typesDisp.add(typesDisplay);

  return typesDisp;
}