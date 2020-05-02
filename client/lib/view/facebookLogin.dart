import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

class FacebookPage extends StatefulWidget{
  @override
  _FacebookPageState createState() => _FacebookPageState();
}

class _FacebookPageState extends State<FacebookPage>{
  bool isLoggedIn = false;
  var profileData;

  var facebookLogin = FacebookLogin();

  void newLoginStatus(bool isLoggedIn, {profileData}){
    setState(() {
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Sign In With Facebook"),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: () => facebookLogin.isLoggedIn
                .then((isLoggedIn) => isLoggedIn ? _logout() : {}),
            ),
          ],
        ),
        body: Container(
          child: Center(
            child: isLoggedIn
                ? _displayUserData(profileData)
                : _displayLoginButton(),
          ),
        ),
      ),
      theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.grey[600],
        ),
        primaryColor: Colors.blue[500],
        textSelectionHandleColor: Colors.blue[500],
      ),
    );
  }

  _logout() async{
    await facebookLogin.logOut();
    newLoginStatus(false);
    print("Logged out");
  }

  _displayUserData(profileData){
    //DO THINGS
  }

  _displayLoginButton(){
    return RaisedButton(
      child: Text("Login With Facebook"),
      onPressed: () => initiateFacebookLogin(),
      color: Colors.blue,
      textColor: Colors.white,
    );
  }

  void initiateFacebookLogin() async {
    var facebookLoginResult =
        await facebookLogin.logInWithReadPermissions(['email']);

    switch (facebookLoginResult.status){
      case FacebookLoginStatus.error:
      case FacebookLoginStatus.cancelledByUser:
        newLoginStatus(false);
        break;
      case FacebookLoginStatus.loggedIn:
        var response = await http.get('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.width(400)&access_token=${facebookLoginResult
            .accessToken.token}');

        var profile = json.decode(response.body);
        print(profile.toString());

        newLoginStatus(true, profileData: profile);
        break;
    }
  }

}

