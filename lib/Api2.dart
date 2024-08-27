
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mailer/mailer.dart';

class Api3 extends StatefulWidget {
  const Api3({super.key});

  @override
  State<Api3> createState() => _Api3State();
}

class _Api3State extends State<Api3> {
  Future<List<MediaPosts>>? futurePosts;

  Future<List<MediaPosts>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    // Check response
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      List limitedResponse = jsonResponse.take(20).toList();
      return limitedResponse.map((post) => MediaPosts.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load API');
    }
  }

  void fetchAndSetPosts() {
    setState(() {
      futurePosts = fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor:Color.fromARGB(255, 000, 051, 000),

          centerTitle: true,
          title: Text(
            'Product Details',
            style: TextStyle(
              fontSize: 22,
              fontFamily: "workSans",
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              FutureBuilder<List<MediaPosts>>(
                future: fetchPosts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text('No data found');
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final post = snapshot.data![index];
                          return Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),

                              Container(
                                  height: 400,
                                  width:double.infinity,
                                  child: Image(image: NetworkImage('${post.image}')
                                  )
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius:BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 000, 051, 000),
                                ),
                                width:200,
                                child: Center(
                                  child: Text(
                                    'TITLE:${post.title}\n'
                                        'Price:${post.price}\n'
                                        'Category:${post.category}\n'
                                        'RATING: ${post.rating['rate']} (${post.rating['count']} reviews)',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "workSans",
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MediaPosts {
  final String title;
  final double price;
  final String image;
  final String category;
  final Map<String,dynamic> rating;



  const MediaPosts({
    required this.title,
    required this.price,
    required this.image,
    required this.category,
    required this.rating
  });

  factory MediaPosts.fromJson(Map<String, dynamic> json) {
    return MediaPosts(
        title: json['title'],
        price: json['price'].toDouble(),
        image: json['image'],
        category:json['category'],
        rating: json['rating']


    );
  }
}

// class Ratehere {
//   final double rate;
//   final int count;
//
//   const Ratehere({
//     required this.rate,
//     required this.count
// });
//
//   factory Ratehere.fromJson(Map<String,dynamic> json){
//     return Ratehere(rate: json['rate'].toDouble(), count: json['count']);
//   }
//
// }