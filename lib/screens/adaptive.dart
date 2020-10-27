import 'package:flutter/material.dart';
import 'package:intermedieteflutter/arguments/arg_adaptive.dart';
import 'package:intermedieteflutter/models/joke.dart';
import 'package:intermedieteflutter/screens/device.dart';

class Adaptive extends StatefulWidget {
  static final String screenId = "adaptive";
  @override
  _AdaptiveState createState() => _AdaptiveState();
}

class _AdaptiveState extends State<Adaptive> {
  Joke jokeOptions;
  @override
  Widget build(BuildContext context) {
    Widget content;
    var screenSize = MediaQuery.of(context).size.shortestSide;
    var screenOrientation = MediaQuery.of(context).orientation;

    if(screenOrientation == Orientation.portrait && screenSize < 600){
      content = buildNotTablet();
    }else{
      content = buildTablet();
    }
  
    
    return Scaffold(
      appBar: AppBar(title: Text("Adaptive"),),
      body: content,
    );
  }

  Widget buildNotTablet(){
    return Device(jokeCallback: (value){
      Navigator.pushNamed(context, DeviceDetail.screenId,  arguments: AdaptiveArgument(false, value));
    });
  }

  Widget buildTablet(){
    return Row(children: [
      Flexible(child: Device(jokeCallback: (value){
        setState((){
          jokeOptions = value;
        });
      },
      joke: jokeOptions,
      )),
      Flexible(child: DeviceDetail(deviceType: true, joke: jokeOptions,))
    ],);
  }
}