import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:client/view/facebookLogin.dart';
import 'package:client/view/start_view.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
  final facebookLogin = FacebookLogin();
}

class _LoginPageState extends State<LoginPage> {
  Future<http.Response> futureGreeting;

  void _greetServer() {
    setState(() {
      futureGreeting = _getGreeting();
    });
  }

  Future<http.Response> _getGreeting() async {
    print('sending request to server');
    http.Response r =
    await http.get('https://group2-75.pvt.dsv.su.se/hello?name=group72');
    print('${r.body}');
    return r;
  }

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
                        FacebookPage();
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