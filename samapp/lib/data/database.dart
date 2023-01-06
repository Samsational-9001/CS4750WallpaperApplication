import '../imagesDisplay/typesDisplay.dart';

List<TypesDisplay> getCategories(){
  List<TypesDisplay> typesDisp = List<TypesDisplay>.empty();
  TypesDisplay typesDisplay = new TypesDisplay();

  //the static example
  typesDisplay.imageUrl = "https://www.psdstack.com/wp-content/uploads/2019/08/copyright-free-images-750x420.jpg";
  typesDisplay.types = "Static";
  typesDisp.add(typesDisplay);

  //the dynamic model
  typesDisplay = new TypesDisplay();
  typesDisplay.imageUrl = "https://media.giphy.com/media/B0g68d61knrG0/giphy.gif";
  typesDisplay.types = "Dynamic";
  typesDisp.add(typesDisplay);

  return typesDisp;
}