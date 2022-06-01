import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
class LoginSignup{
  var urlSignup=Uri.parse('http://172.16.3.183/api/signup');
  var urlLogin=Uri.parse('http://172.16.3.183/api/login');
  Future<void> addUser(Map newUser) async{
     final response=await http.post(urlSignup, body: newUser);
     if(response.statusCode==200){
       print(jsonDecode(response.body)['Success']);
     }else{
       print(jsonDecode(response.body)["Success"]);
     }
  }

  Future<void> loginUser(Map loginUser) async{
    final response=await http.post(urlLogin, body: loginUser);
    if(response.statusCode==200){
      print(jsonDecode(response.body)['Success']);
    }else{
      print(jsonDecode(response.body)["Success"]);
    }
  }

}