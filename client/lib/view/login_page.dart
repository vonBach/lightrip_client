import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:client/view/facebookLogin.dart';
import 'package:client/view/start_view.dart';


class GooglePage extends StatefulWidget{
  @override
  _GooglePageState createState() => _GooglePageState();
}

class _GooglePageState extends State<GooglePage> {

  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.all (8),
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Some text',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget optionBar = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          /*1*/
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*2*/
              Container(
                padding: const EdgeInsets.all (32),
                child: ButtonBar(
                buttonMinWidth: 300,
                buttonHeight: 50,
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    child: Text('Continue with Facebook'),
                    color: Colors.white,
                    onPressed: () {
                       // facebookPage(context);
                        GooglePage();
                    },
                  ),
                  FlatButton(
                    child: Text('ontinue with Google'),
                    color: Colors.white,
                    onPressed: () {
                      //do something
                    },
                  ),
                  FlatButton(
                    child: Text('ontinue with Email'),
                    color: Colors.white,
                    onPressed: () {
                      // do something
                     },
                    ),
                  ],
                  ),
                ),
                ], //Children
              ),
            ),
            ],
          ),
        );



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        ),
        body: Column(
          children: [
            titleSection,
            optionBar,
          ],
        ),
      ),
    );
  }


  void facebookPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return FacebookPage();
    }));
  }

}