// import 'package:flutter/material.dart';
//
// class Snackbareg extends StatefulWidget {
//   const Snackbareg({super.key});
//
//   @override
//   State<Snackbareg> createState() => _SnackbaregState();
// }
//
// class _SnackbaregState extends State<Snackbareg> {
//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Snackbar",
//           style: TextStyle(
//             backgroundColor: Colors.white,
//             fontFamily: "workSans",
//               color: Colors.black
//
//           ),
//           ),
//         ),
//         body:Center(
//           child: ElevatedButton(
//             onPressed: (){
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                     content: Text("Now,you have clicked an Elevated button"),
//                   duration: Duration(seconds:3),
//                   action: SnackBarAction(
//                     label: 'undo',
//                     onPressed: (){
//                       print("Snack has disappeared");
//                     },
//                   ),
//                 ),
//               );
//             },
//             child: Text("Click to see message"),
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

class Snackbareg extends StatefulWidget {
  const Snackbareg({super.key});

  @override
  State<Snackbareg> createState() => _SnackbaregState();
}

class _SnackbaregState extends State<Snackbareg> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Snackbar",
              style: TextStyle(
                  backgroundColor: Colors.white,
                  fontFamily: "workSans",
                  color: Colors.black

              ),
            ),
          ),
          body:Snackbarex()
      ),
    );
  }
}


class Snackbarex extends StatefulWidget {
  const Snackbarex({super.key});

  @override
  State<Snackbarex> createState() => _SnackbarexState();
}

class _SnackbarexState extends State<Snackbarex> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Now,you have clicked an Elevated button"),
              duration: Duration(seconds:3),
              action: SnackBarAction(
                label: 'undo',
                onPressed: (){
                  print("Snack has disappeared");
                },
              ),
            ),
          );
        },
        child: Text("Click to see message"),
      ),
    );
  }
}
