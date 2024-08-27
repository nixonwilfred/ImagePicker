//
// import 'package:flutter/material.dart';
// import 'package:mailer/mailer.dart';
// import 'package:mailer/smtp_server.dart';
//
// class Mailme extends StatefulWidget {
//   const Mailme({super.key});
//
//   @override
//   State<Mailme> createState() => _MailmeState();
// }
//
// class _Mailme State extends State<Mailme> {
//   final TextEditingController _recipientController=TextEditingController();
//   final TextEditingController _subjectController=TextEditingController();
//   final TextEditingController _bodyController= TextEditingController();
//
//   void _sendEmail() async{
//     String username="nixonwilfred@gmail.com";
//     String password="umymmdtewoybhsrf";
//
//     final smtpServer=gmail(username,password);
//
//     final message=Message()
//     ..from =Address(username,"Nixon")
//     ..recipients.add(_recipientController.text)
//     ..subject=_subjectController.text
//     ..text=_bodyController.text;
//
//     try{
//       final sendReport= await send(message, smtpServer);
//       print("Message Sent: "+sendReport.toString());
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Email sent Successfully")),
//       );
//     }
//     on MailerException catch (e) {
//       print("Message not sent");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Email failed to send")),
//       );
//       for(var p in e.problems){
//         print(('problem:${p.code}: ${p.msg}'));
//     }
//
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Mail Me"),
//         ),
//         body: Column(
//           children: [
//             TextField(
//               controller: _recipientController,
//               decoration: InputDecoration(
//                 labelText: "Recipient"
//               ),
//             ),
//             TextField(
//               controller: _subjectController,
//               decoration: InputDecoration(
//                   labelText: "Subject"
//               ),
//             ),
//             TextField(
//               controller: _bodyController,
//               decoration: InputDecoration(
//                   labelText: "Body"
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//                 onPressed: _sendEmail,
//                 child: Text("Send Email"),
//             ),
//           ],
//         ),
//
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

// <uses-permission android:name="android.permission.INTERNET"/>



class MailMe extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
home: EmailSenderScreen(),
);
}
}

class EmailSenderScreen extends StatefulWidget {
@override
_EmailSenderScreenState createState() => _EmailSenderScreenState();
}

class _EmailSenderScreenState extends State<EmailSenderScreen> {

final TextEditingController _recipientController = TextEditingController();
final TextEditingController _subjectController = TextEditingController();
final TextEditingController _bodyController = TextEditingController();

void _sendEmail() async {
String username = 'alexnoha37@gmail.com';
String password = 'loskxafreqmzslns';

final smtpServer = gmail(username, password);

final message = Message()
..from = Address(username, 'Noha')
..recipients.add(_recipientController.text)
..subject = _subjectController.text
..text = _bodyController.text;

try {
final sendReport = await send(message, smtpServer);
print('Message sent: ' + sendReport.toString());
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text('Email sent successfully!')),
);
} on MailerException catch (e) {
print('Message not sent. $e');
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text('Failed to send email.')),
);
for (var p in e.problems) {
print('Problem: ${p.code}: ${p.msg}');
}
}
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Send Email'),
),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
children: [
TextField(
controller: _recipientController,
decoration: InputDecoration(labelText: 'Recipient'),
),
TextField(
controller: _subjectController,
decoration: InputDecoration(labelText: 'Subject'),
),
TextField(
controller: _bodyController,
decoration: InputDecoration(labelText: 'Body'),
maxLines: 5,
),
SizedBox(height: 20),
ElevatedButton(
onPressed: _sendEmail,
child: Text('Send Email'),
),
],
),
),
);
}
}
