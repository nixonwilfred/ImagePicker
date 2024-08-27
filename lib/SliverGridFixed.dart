import 'package:flutter/material.dart';

class Slivergridfixed extends StatelessWidget {
  const Slivergridfixed({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight:50,
              collapsedHeight: 100,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Demo"),
              ),

            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
            (BuildContext context,int index){
              return Container(
                alignment:Alignment.center ,
                color: Colors.teal[100*(index %9)],
                child: Text("Grid Item ${index}"),
              );
            },
                  childCount: 20
                ),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
                  mainAxisSpacing: 20,
                  crossAxisSpacing:30,
                  childAspectRatio: 2,

            )
            ),
            SliverFixedExtentList(delegate:SliverChildBuilderDelegate(
                    (BuildContext context,int index){
                  return Container(
                    alignment:Alignment.center ,
                    color: Colors.blue[100*(index %9)],
                    child: Text("Grid Item ${index}"),
                  );
                },
                childCount: 20
            ),
                itemExtent: 100)
          ],
        ),
      ),
    );
  }
}


