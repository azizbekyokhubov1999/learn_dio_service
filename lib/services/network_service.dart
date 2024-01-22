
import 'dart:convert';
import 'package:http/http.dart';
import 'package:learn_dio_service/services/dio_service.dart';

class NetworkService{

  static const baseUrl = "65ace4a7adbd5aa31bdfb633.mockapi.io";

  // APIS
  static String apiGetAllProducts = '/users';
  static String apiDeleteProduct = '/users/';
  static String apiUpdateProduct = '/users/';



  // headers
  static Map<String, String>? headers = {
    'Content-Type': 'application/json',
  };

  //methods
  static Future<List?>  getWithDio() async {
    return await DioService.fetchData();
  }

  static Future<String?> POST(String api, Map<String, dynamic> body) async{
    Uri url = Uri.https(baseUrl, api);
    Response response = await post(url, headers: headers, body: jsonEncode(body));
    if(response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return response.reasonPhrase;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> body, String id) async {
    final url = Uri.https(baseUrl, "$api$id");
    final response = await put(url, body: jsonEncode(body), headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, String id) async {
    final url = Uri.https(baseUrl, "$api$id");
    final response = await delete(url, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }
}
