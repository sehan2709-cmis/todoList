import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/config/palette.dart';
import 'package:todo_list/screens/main_screen.dart';
import 'package:todo_list/screens/second_page.dart';
import 'package:firebase_database/firebase_database.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //final FirebaseApp appp;

  @override
  Widget build(BuildContext context) {

    final detabaseRef = FirebaseDatabase.instance.reference();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.light,
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => StartPage(),
        "/s": (context) => SecondPage(app: detabaseRef,),
      },
    );
  }
}
