import 'package:flutter/material.dart';
import 'package:client/view/start_view.dart';


//Entry point hands over control to the controller
void main() => runApp(StartApp());

class StartApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: StartView(),
    );
  }
}
