import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Animated Loader',
      debugShowCheckedModeBanner: false,
      home: AnimatedLoader(),
    );
  }
}

class AnimatedLoader extends StatefulWidget {
  @override
  _AnimatedLoaderState createState() => _AnimatedLoaderState();
}

class _AnimatedLoaderState extends State<AnimatedLoader>
    with TickerProviderStateMixin {
  final Duration duration = Duration(milliseconds: 400);
  final double upperOffset = -0.5;
  final double lowerOffset = 0.5;

  AnimationController _firstController;
  AnimationController _secondController;
  AnimationController _thirdController;
  AnimationController _fourthController;

  Animation<Offset> _firstBall;
  Animation<Offset> _secondBall;
  Animation<Offset> _thirdBall;
  Animation<Offset> _fourthBall;

  @override
  void initState() {
    super.initState();
    _firstController = AnimationController(vsync: this, duration: duration)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _firstController.repeat(reverse: true);
        }
      });
    _secondController = AnimationController(vsync: this, duration: duration)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _secondController.repeat(reverse: true);
        }
      });
    _thirdController = AnimationController(vsync: this, duration: duration)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _thirdController.repeat(reverse: true);
        }
      });
    _fourthController = AnimationController(vsync: this, duration: duration)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _fourthController.repeat(reverse: true);
        }
      });
    _firstBall =
        Tween(begin: Offset(0.0, upperOffset), end: Offset(0.0, lowerOffset))
            .animate(_firstController);
    _secondBall =
        Tween(begin: Offset(0.0, upperOffset), end: Offset(0.0, lowerOffset))
            .animate(_secondController);
    _thirdBall =
        Tween(begin: Offset(0.0, upperOffset), end: Offset(0.0, lowerOffset))
            .animate(_thirdController);
    _fourthBall =
        Tween(begin: Offset(0.0, upperOffset), end: Offset(0.0, lowerOffset))
            .animate(_fourthController);
  }

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    _thirdController.dispose();
    _fourthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 100.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  _firstController.forward();
                  Timer(Duration(milliseconds: 100), () {
                    _secondController.forward();
                  });
                  Timer(Duration(milliseconds: 200), () {
                    _thirdController.forward();
                  });
                  Timer(Duration(milliseconds: 300), () {
                    _fourthController.forward();
                  });
                },
                child: Container(
                  height: 90.0,
                  width: 280.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Color(0xFF000030), width: 3.0),
                  ),
                  child: Center(
                    child: Text(
                      "Loading...",
                      style: TextStyle(
                          fontSize: 45.0,
                          color: Color(0xFF000030),
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SlideTransition(
                  position: _firstBall,
                  child: Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [
                              Colors.yellow[400],
                              Colors.yellow[800],
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                ),
                SizedBox(width: 25.0),
                SlideTransition(
                  position: _secondBall,
                  child: Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [
                              Colors.red[400],
                              Colors.red[800],
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                ),
                SizedBox(width: 25.0),
                SlideTransition(
                  position: _thirdBall,
                  child: Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [
                              Colors.cyan[400],
                              Colors.cyan[800],
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                ),
                SizedBox(width: 25.0),
                SlideTransition(
                  position: _fourthBall,
                  child: Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [
                              Colors.purple[400],
                              Colors.purple[800],
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
