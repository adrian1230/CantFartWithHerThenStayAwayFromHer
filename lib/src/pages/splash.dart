import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/src/pages/slot.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);
  @override
  _Splash createState() => _Splash();
}

class _Splash extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((_) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Slot()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asseg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: .6,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.grey.withOpacity(0.3),Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.mirror,
                      stops: [.5, 6]),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: SizedBox(width: 5,),
              ),
              Text(
                "Find your love one",
                style: TextStyle(fontWeight: FontWeight.w700,fontSize: 35,color:Colors.pinkAccent),
              ),
              Expanded(
                flex: 5,
                child: SizedBox(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
