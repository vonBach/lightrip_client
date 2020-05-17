import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client/view/map_page.dart';
import 'package:client/view/start_view.dart';
import 'package:client/widgets/navigationButton_widget.dart';
import 'package:client/custom_color.dart';

class LogInView extends StatefulWidget {
  @override
  _LogInViewState createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
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
                    'Welcome back',
                    style: TextStyle(fontSize: 40.0),
                  )),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 250,
                    height: 40,
                    child: NavigationButtonWidget(
                      color: new MaterialColor(0xFFFFFFFF, color),
                      title: Text('Textfield',
                          style: TextStyle(color: Colors.black)),
                      //navigateTo: MapPage(),
                    ),
                  ),
                  ButtonTheme(
                      minWidth: 250,
                      height: 40,
                      child: NavigationButtonWidget(
                        color: new MaterialColor(0xFFFFFFFF, color),
                        title: Text('Password',
                            style: TextStyle(color: Colors.black)),
                        //navigateTo: MapPage(),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 20),
                      child: ButtonTheme(
                          height: 40,
                          child: NavigationButtonWidget(
                            color: Colors.red,
                            title: Text(
                              'Sign in',
                            ),
                            navigateTo: MapPage(),
                          ))),
                ],
              ),
              Row(children: <Widget>[
                Text('Already have an account? '),
                InkWell(
                  child: Text('Register',
                      style: TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.underline)),
                  onTap: () {
                    registerPage(context);
                  },
                )
              ])
            ],
          )
        ]));
  }
}

void registerPage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return StartView();
  }));
}
