import 'dart:convert';
import 'package:http/http.dart' as http;
class Backend{
  static String baseURL = "http://localhost:3000";


  // json listat ad vissza (user, series)
  static Future<List<dynamic>> Get({required String route}) async{
    var response=await http.get(Uri.parse(baseURL+route));
    return json.decode(response.body) as List<dynamic>; 
  }

  // json listat ad vissza (login, reg)
  static Future<List<dynamic>> POST({required String route, required Map body}) async{
    var response=await http.post(Uri.parse(baseURL+route), body: body);
    return json.decode(response.body) as List<dynamic>; 
  }
  // uzenetet ad vissza (edit profile)
  static Future<String> PUT({required String route, required Map body}) async{
    var response=await http.put(Uri.parse(baseURL+route), body: body);
    return json.decode(response.body) as String; 
  }

  //kép elérését/nevét adja vissza (file upload)
  //body paramétere/kulcs/-->image
  static Future<String> FILE({required String route, required List<int> image}) async{
    var request=await http.MultipartRequest('PUT', Uri.parse(baseURL))..files.add(await http.MultipartFile.fromBytes('images', image, filename: 'image.png'));
    var response = await request.send();
    String json = await response.stream.bytesToString();
    return json.replaceAll("\"",""); // "2023-02-12-image.jpg" --> 2023-02-12
  }
}