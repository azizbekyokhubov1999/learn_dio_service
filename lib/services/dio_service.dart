
import 'package:dio/dio.dart';

class DioService{
static final _dio = Dio();
static Future<List?> fetchData()async{
  Response response = await _dio.get("https://65ace4a7adbd5aa31bdfb633.mockapi.io/users");
  if(response.statusCode == 200 || response.statusCode == 201){
    return response.data;
  }
  else{
    return null;
  }
}

}