import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget{


  @override
  State createState() {
    return AppButtonState();
  }
}

class AppButtonState extends State<AppButton>{
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Open Map")
    );
  }

}