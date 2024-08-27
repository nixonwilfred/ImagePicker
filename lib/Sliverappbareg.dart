import 'package:flutter/material.dart';

class Sliverappbareg extends StatefulWidget {
  const Sliverappbareg({super.key});

  @override
  State<Sliverappbareg> createState() => _SliverappbaregState();
}

class _SliverappbaregState extends State<Sliverappbareg> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              collapsedHeight: 30.0,
              toolbarHeight: 30.0,
              expandedHeight: 100.0,
              pinned: true,
              backgroundColor: Colors.deepPurple,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Sliver App Bar",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),

              ),


            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context,int index){
                      return Container(
                        height: 50,
                        width: 50,
                        color: Colors.white,
                        child: Column(
                          children:[
                            Text("Container number: ${index+1}",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white
                            ),
                            ),

                          ],
                        ),
                      );
                    },
                  childCount:50,
                ),
            ),

          ],
        ),
      ),
    );
  }
}
