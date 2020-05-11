import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationButtonWidget extends StatelessWidget{


  NavigationButtonWidget({this.title, this.navigateTo});
  final Widget title;
  final Widget navigateTo;


  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: title,
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)
        {
          return navigateTo;
        }))
    );
  }


}