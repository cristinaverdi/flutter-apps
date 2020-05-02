import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
    @override
    _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    BackGroundWithGradientBuilder _backGroundWithGradientBuilder =
    BackGroundWithGradientBuilder();




    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
                child: Stack(
                    children: <Widget>[
                        _backGroundWithGradientBuilder
                            .decoration(spotsDecoration())
                            .build()
                    ],
                ),
                value: SystemUiOverlayStyle.light),
        );
    }

    BoxDecoration spotsDecoration() {
        List<double> _stops = [0.1, 0.4, 0.7, 0.9];
        List<Color> _colors = [
            Color(0xFFDAEEDC),
            Color(0xFFCEE8CE),
            Color(0xFFB8D9C0), // 0xFFCEE8CE
            Color(0xFF82A684),
        ];

        return BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: _colors,
                stops: _stops,
          ),
      );
    }
}

class BackGroundWithGradientBuilder implements BackGroundBuilder {
    double _width;
    double _height;
    BoxDecoration _decoration;

    @override
    Container build() {
        return Container(
            height: _height ?? double.infinity,
            width: _width ?? double.infinity,
            decoration: _decoration ?? BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                        Color(0xFF73AEF5),
                        Color(0xFF61A4F1),
                        Color(0xFF478DE0),
                        Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                ),
            ),
        );
    }

    @override
    BackGroundBuilder decoration(BoxDecoration decoration) {
        _decoration = decoration;
        return this;
    }

    @override
    BackGroundBuilder height(double height) {
        _height = height;
        return this;
    }

    @override
    BackGroundBuilder width(double width) {
        _width = width;
        return this;
    }
}

abstract class BackGroundBuilder {
    BackGroundBuilder height(double height);

    BackGroundBuilder width(double width);

    BackGroundBuilder decoration(BoxDecoration decoration);

    Container build();
}
