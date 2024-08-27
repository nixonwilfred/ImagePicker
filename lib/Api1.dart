import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class api1 extends StatefulWidget {
  const api1({super.key});

  @override
  State<api1> createState() => _api1State();
}

class _api1State extends State<api1> {

  Future<MediaPosts> fetchPosts() async{
    final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments/1'));
    //check response
    if(response.statusCode==200){
      return MediaPosts.fromJson(jsonDecode(response.body));
    }
    else{
      throw Exception('Failed to load Api');
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text('API - 1',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor:Colors.black,
        body: Center(
          child: ElevatedButton(
            onPressed: (){
              fetchPosts().then((value){
                print(value.id);
                print(value.postId);
                print(value.name);
                print(value.email);
                print(value.body);
              });
            },
            child: Text(
                'API GET'
            ),
          ),
        ),
      ),
    );
  }
}


class MediaPosts{
  final int id;
  final int postId;
  final String name;
  final String email;
  final  String body;

  const MediaPosts({required this.id,required this.postId, required this.name, required this.email, required this.body});

  factory MediaPosts.fromJson(Map<String,dynamic> json){
    return MediaPosts(id: json['id'], postId: json['postId'], name: json['name'], email: json['email'], body: json['body']);
  }
}