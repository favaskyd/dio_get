import 'package:dio/dio.dart';

class DioClient{
  Dio dio=Dio();

  static const _baseURL="https://dog.ceo/api/breeds/";


Future<Response>getQuery(String routeURL) async{
  String url=_baseURL+routeURL;
  Response response=await dio.get(url);
  return response;
}
}