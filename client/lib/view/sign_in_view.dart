import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client/view/start_view.dart';
import 'package:client/view/log_in_vjew.dart';
import 'package:client/widgets/navigationButton_widget.dart';
import 'package:client/view/map_page.dart';
import 'package:client/custom_color.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
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
                    'Sign in',
                    style: TextStyle(fontSize: 35.0, fontFamily: 'Poppins'),
                  )),
              Column(
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 250,
                    height: 40,
                    child: NavigationButtonWidget(
                      color: new MaterialColor(0xFF3c5899, color),
                      title: Text('Continue with Facebook',
                          style:
                              TextStyle(fontSize: 12.0, fontFamily: 'Poppins')),
                      navigateTo: MapPage(),
                    ),
                  ),
                  ButtonTheme(
                      minWidth: 250,
                      height: 40,
                      child: NavigationButtonWidget(
                        color: new MaterialColor(0xFFdd3521, color),
                        title: Text('Continue with Google'),
                        navigateTo: MapPage(),
                      )),
                  ButtonTheme(
                      minWidth: 250,
                      height: 40,
                      child: NavigationButtonWidget(
                        color: new MaterialColor(0xFFFFFFFF, color),
                        title: Text('Continue with Email',
                            style: TextStyle(color: Colors.black)),
                        navigateTo: LogInView(),
                      )),
                ],
              ),
              Row(children: <Widget>[
                Text('Don\'t have an account? '),
                InkWell(
                  child: Text('Register',
                      style: TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.underline)),
                  onTap: () {
                    startPage(context);
                  },
                )
              ])
            ],
          )
        ]));
  }
}

void startPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return StartView();
  }));
}
