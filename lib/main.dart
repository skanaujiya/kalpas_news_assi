import 'package:flutter/material.dart';
import 'package:kalpas_as/loginPage.dart';
import 'package:get/get.dart';
void main(){
  runApp(
    GetMaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        primaryColor: Colors.black
      ),
      home: LoginPage(),
    )
  );
}