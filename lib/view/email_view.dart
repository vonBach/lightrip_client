import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client/view/map_page.dart';
import 'package:client/view/sign_in_view.dart';
import 'package:client/widgets/navigationButton_widget.dart';
import 'package:client/custom_color.dart';

class EmailView extends StatefulWidget {
  @override
  _EmailViewState createState() => _EmailViewState();
}

class _EmailViewState extends State<EmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: new MaterialColor(0xFF191a1f, color),
        body:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  height: 250,
                  width: 250,
                  child: Image(
                      image: AssetImage('assets/Lightrip_Logo_no_bg.png'))),
              Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 35.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      width: 250,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0)),
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                          hintText: "Username",
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 10),
                      width: 250,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18.0)),
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500),
                          hintText: "Password",
                        ),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 20),
                      child: ButtonTheme(
                          height: 40,
                          child: NavigationButtonWidget(
                            color: new MaterialColor(0xFFE5305A, color),
                            title: Text('Sign up',
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500)),
                            navigateTo: MapPage(),
                          ))),
                ],
              ),
              Row(children: <Widget>[
                Text('Already have an account? '),
                InkWell(
                  child: Text('Login',
                      style: TextStyle(
                          fontSize: 12.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: new MaterialColor(0xFFE5305A, color),
                          decoration: TextDecoration.underline)),
                  onTap: () {
                    signInPage(context);
                  },
                )
              ])
            ],
          )
        ]));
  }
}

void signInPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return SignInView();
  }));
}
