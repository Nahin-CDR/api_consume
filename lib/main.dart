import 'package:flutter/material.dart';

import 'homePage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login_screen.dart';

//import 'login_screen.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title:const Text("Firebase Authentication"),
        ),
        body: LoginWidget(),
      ),
    );
  }
}








// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return  HomePage();
//   }
//
// }