// // https://api.openweathermap.org/data/2.5/weather?q={city name}&appid=c2ec6571756a51bb7fd8e1036dba6e10
//
//
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:imagepickerapp/Ecommerce.dart';
//
// class Weatherwidget extends StatelessWidget {
//   const Weatherwidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Homepage();
//   }
// }
// class Homepage extends StatefulWidget {
//   const Homepage({super.key});
//
//   @override
//   State<Homepage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//   get http => null;
//
//
//   Future<FetchWeather> fetchPosts() async{
//     final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments/1'));
//     //check response
//     if(response.statusCode==200){
//       return FetchWeather.fromJson(jsonDecode(response.body));
//     }
//     else{
//       throw Exception('Failed to load Api');
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//
//
//         ),
//       ),
//
//     );
//   }
//
// }
//
// class FetchWeather {
//   Final double temp;

//
//   final Future<FetchWeather> fromJson(jsonDecode) {}
// }
//
