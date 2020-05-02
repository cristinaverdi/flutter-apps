import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/screens/login/login_ui.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Login UI',
        debugShowCheckedModeBanner: false,
        home: LoginScreen());
  }
}
