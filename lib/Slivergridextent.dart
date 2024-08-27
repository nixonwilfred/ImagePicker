import 'package:flutter/material.dart';
import 'package:imagepickerapp/Ecommerce.dart';

class Slivergridextenteg extends StatelessWidget {
  const Slivergridextenteg({super.key});

  @override
  Widget build(BuildContext context) {
    return Homepage();
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
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height:  100,
              ),
            ),
            SliverGrid.extent(
                maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1,
              children: [
                Container(
                    color: Colors.red
                ),
                Container(
                    color: Colors.green
                ),
                Container(
                    color: Colors.grey
                ),
                Container(
                    color: Colors.blueAccent
                ),
                Container(
                    color: Colors.blueGrey
                ),
                Container(
                    color: Colors.white
                ),
                Container(
                    color: Colors.lightBlue
                ),
                Container(
                    color: Colors.deepPurple
                ),
                Container(
                    color: Colors.green
                ),
                Container(
                    color: Colors.blueGrey
                ),
                Container(
                    color: Colors.green
                ),
                Container(
                    color: Colors.grey
                ),
                Container(
                    color: Colors.blueAccent
                ),
                Container(
                    color: Colors.blueGrey
                ),
              ],


            )
          ],
        ),
      ),
    );
  }
}
