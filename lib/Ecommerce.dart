import 'package:flutter/material.dart';
import 'package:imagepickerapp/Api2.dart';
import 'package:imagepickerapp/Api4.dart';
import 'package:imagepickerapp/Womansclothing.dart';

class Ecommerce extends StatelessWidget {
  const Ecommerce({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage()
    );

  }
}


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(



        body: Container(
          width: 800,
                  decoration: BoxDecoration(
                   image:DecorationImage(
                     image: AssetImage("images/image4.jpg"),
                     fit: BoxFit.cover
                   )
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 800,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text("MY SHOPPING",
                          textAlign: TextAlign.center,
                          style:TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontFamily:"workSans"



                          ),
                          ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 60,
                            alignment: Alignment.center,

                            child: ElevatedButton(


                              onPressed: (){
                                setState(() {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Api4(),));


                                });

                                },

                              child:Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.black,
                                size: 30,

                              ),
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(Color.fromARGB(255, 255,235,205)),

                              ),
                            ),
                          ),

                        ],
                      ),


                    ],
                  ),
                ),

         ),
       );
     }
   }

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

