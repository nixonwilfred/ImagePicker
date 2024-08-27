import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api1 extends StatefulWidget {
  const Api1({super.key});

  @override
  State<Api1> createState() => _Api1State();
}

class _Api1State extends State<Api1> {

  Future<List<MediaPosts>>? futurePosts;

  Future<List<MediaPosts>> fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    // Check response
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((post) => MediaPosts.fromJson(post)).toList();
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
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text(
            'API - 1',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: fetchAndSetPosts,
                child: Text('API GET'),
              ),
              SizedBox(
                  height: 20
              ),
              FutureBuilder<List<MediaPosts>>(
                future: futurePosts,
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
                                color: Colors.red,
                                child: Center(
                                  child: Text(
                                    'ID: ${post.id} \n'
                                        'POSTID:${post.postId}\n'
                                        'EMAIL:${post.email}\n'
                                        'NAME:${post.name}\n'
                                        'BODY:${post.body}\n',

                                    style: TextStyle(
                                      color: Colors.white,
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
  final int id;
  final int postId;
  final String name;
  final String email;
  final String body;

  const MediaPosts({
    required this.id,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  factory MediaPosts.fromJson(Map<String, dynamic> json) {
    return MediaPosts(
      id: json['id'],
      postId: json['postId'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}