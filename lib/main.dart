import 'package:flutter/material.dart';
import 'package:musicplayer/test.dart';
import 'Screens/HomePage.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: "Home Page",
      home: HomePage(),
    );
  }
}