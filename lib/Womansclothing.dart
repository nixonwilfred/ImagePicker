
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api5 extends StatefulWidget {
  const Api5({super.key});

  @override
  State<Api5> createState() => _Api5State();
}

class _Api5State extends State<Api5> {
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
            'Womens clothing',
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
            children:[
              SizedBox(
                  height: 20),

              FutureBuilder<List<MediaPosts>>(
                future: fetchPosts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Text(' ');
                  } else {
                    return Expanded(
                      child: ListView.builder(

                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final post = snapshot.data![index];
                          if(post.category=="women's clothing"){

                            return Column(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        color: Color.fromARGB(255, 000, 051, 000),
                                        width:4,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  //color: Colors.blue,
                                  child: Column(
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

                                        child: Text(
                                          'TITLE:${post.title}\n'
                                              'Price:${post.price}\n'
                                              'Category:${post.category}\n'
                                              'RATING: ${post.rating['rate']} (${post.rating['count']} reviews)',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "workSans",
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),

                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),


                              ],
                            );

                          }
                          else{
                            return Container();
                          }


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