import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StartView extends StatefulWidget{

  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  Future<http.Response> futureGreeting;

  void _greetServer(){
    setState(() {
      futureGreeting = _getGreeting();
    });
  }

  Future<http.Response> _getGreeting() async{
    print('sending request to server');
    http.Response r = await http.get('https://group2-75.pvt.dsv.su.se/hello?name=group72');
    print('${r.body}');
    return r;
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Center(
          child: FutureBuilder(
            future: futureGreeting,
            builder: (context, snapshot){
              var _message;
              if(snapshot.hasData){
                _message = snapshot.data.body;
              } else {
                _message = "Press the button to greet server";
              }
              return Text(_message,style: TextStyle(fontSize: 26));
            }
          ),

        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.autorenew),
          onPressed: _greetServer,
        ),
      );
  }
}
