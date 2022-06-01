import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiServices{
  var client=http.Client();
   Future<List>  fetchNews() async{
    var response= await client.get(Uri.parse('https://api.first.org/data/v1/news'));
    List json=jsonDecode(response.body)['data'];
    return json;
  }
}