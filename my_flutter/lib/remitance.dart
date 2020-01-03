
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RemitanceView extends StatelessWidget {


  static const platform = const MethodChannel('samples.rajendra.com/svc');

  Future<void> _routeToViewController(BuildContext context) async {
    Navigator.pop(context);
    SystemNavigator.pop(animated: false);
    try {
      final bool result = await platform.invokeMethod('routeToSecondViewController');
      if (result) {

      } else {

      }
    } on PlatformException catch (e) {
      print(e.toString());
        
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remitance View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Open iOS Native'),
              onPressed: () {
                _routeToViewController(context);
              },
            ),
            RaisedButton(
              child: Text('Open Main'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ]
        )
        
      ),
    );
  }
}