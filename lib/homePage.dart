import 'package:flutter/material.dart';
import 'package:kalpas_as/element/list_of_home_screen.dart';

class Home extends StatefulWidget{
  const Home({Key?key}):super(key: key);
  @override
  HomePage createState()=>HomePage();
}

class HomePage extends State<Home>{
  int currentIndex=0;
  @override
  Widget build(context)=>Scaffold(
    bottomNavigationBar: ClipRRect(
      borderRadius:const BorderRadius.only(topLeft: Radius.circular(20),topRight:  Radius.circular(20) ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        iconSize: 40,
        onTap: (index)=>setState(()=>currentIndex=index),
        selectedItemColor: Colors.white,
        backgroundColor: Colors.blue,
        selectedFontSize: 16,
        unselectedFontSize: 13.5,
        items:const  [
          BottomNavigationBarItem(icon: Icon(Icons.list),label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite,color: Colors.redAccent,),label: 'Favs')
        ],
      ),
    ),
    body:  Center(
      child: screen(currentIndex),
    ),
  );
}