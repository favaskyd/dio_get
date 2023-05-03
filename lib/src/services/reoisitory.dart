import 'package:dio/dio.dart';
import 'package:dio_get/src/services/api_helper.dart';

class DogRepo{
  DioClient dioClient=DioClient();

  static const routeUrl="image/random";

  Future<Response?>getDogImage()async{
    try{
      Response response=await dioClient.getQuery(routeUrl);
      if(response!.statusCode==400||response!.statusCode==401){
        return response;
      }else{
        return response;
      }
    }catch(ex){
      Exception(ex);
    }
  }
}