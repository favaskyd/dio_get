import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_get/src/model/model.dart';
import 'package:dio_get/src/services/reoisitory.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
DogRepo dogRepo=DogRepo();
late String imageUrl;
late String status;
TextEditingController emailController=TextEditingController();
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState(){
    imageUrl="";
    status="hi";
    getDogImage();
  }

  getDogImage()async{
    Response? response=await dogRepo.getDogImage();
    if(response!.statusCode==200||response.statusCode==201){
     var data= json.decode(response.data);
     Dogs dogs=Dogs.fromJson(data);
     print(dogs);
     setState(() {
       imageUrl=dogs.message;
       print(imageUrl);
       status=dogs.status;
     });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Text(status),
          Image.network(imageUrl)
        ],
      ),
    );
  }
}

