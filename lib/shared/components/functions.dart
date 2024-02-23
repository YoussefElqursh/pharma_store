import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/*
definition: this function use in navigate from page to another but you can go back.
how use: when you call this function give this params context , route.
route: this is string that you will go to it.
*/
void navigateTo(BuildContext context, String route){
  Navigator.pushNamed(context, route);
}

/*
definition: this function use in navigate from page to another without go back.
how use: when you call this function give this params context , route.
route: this is widget that you will go to it.
*/
void navigateToWithoutBack(BuildContext context, Widget route){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => route));
}

/*
definition: this function use in to choose between a lot of picture kinds.
how use: when you call this function give this params kind* , path* , height , width.
kind: it's required and have 4 values 0,1,2,3.
0: Image => from local but not svg.
1: SvgPicture => from local svg.
2: Image => from network but not svg.
3: SvgPicture => from network svg.
path: this is path of picture.
*/
Widget setPhoto({required int kind,  String ?path, double? height, double? width}){
  if(kind==0){
    return Image.asset(path!, height: height, width: width);
  }
  else if(kind==1){
    return SvgPicture.asset(path!, height: height, width: width);
  }
  else if(kind==2){
    return Image.network(path!, height: height, width: width);
  }
  else if(kind==3){
    return SvgPicture.network(path!, height: height, width: width);
  }
  else{
    return const Text("error");
  }
}