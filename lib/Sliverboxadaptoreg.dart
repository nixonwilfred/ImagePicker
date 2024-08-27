import 'package:flutter/material.dart';
import 'package:imagepickerapp/Ecommerce.dart';

class Sliverboxadaptoreg extends StatelessWidget {
  const Sliverboxadaptoreg({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sliver Example",
      home: Homepage(),
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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Sliver Example",
            textAlign: TextAlign.center,
            ),
            pinned: true,
            expandedHeight: 80,
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 800,
              color: Colors.deepPurple,
              child: Center(child: Text("Sliver to Box Adaptor",
              style: TextStyle(
                color: Colors.white
              ),)),
            ),
          ),
          SliverAppBar(
            title: Text("Sliver ",
              textAlign: TextAlign.center,
            ),
            pinned: true,
            expandedHeight: 80,
          ),
        ],
      ),
    );
  }
}

