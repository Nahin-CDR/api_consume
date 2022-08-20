


import 'model.dart';
import 'package:http/http.dart' as http;

class Services{
  static Future getUserData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return albumFromJson(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

}