import 'package:flutter/material.dart';
import 'package:intermedieteflutter/models/joke.dart';

class Device extends StatefulWidget {
  static final String screenId = "device";
  Joke joke;
  ValueChanged<Joke> jokeCallback;

  Device({Key key, this.joke, this.jokeCallback}): super(key:key);
  @override
  _DeviceState createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jokesList.map((itemJoke){
        return Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
        shape: BoxShape.rectangle
        ),
        child: ListTile(
          onTap: ()=>widget.jokeCallback(itemJoke),
          selected: widget.joke == itemJoke,
          title: Text(itemJoke.setup, style: TextStyle(color: Colors.blue, fontSize: 25),)),);
      }).toList(),
    );
  }
}

class DeviceDetail extends StatelessWidget {
  static final String screenId = "devicedetail";
  
  final bool deviceType;
  final Joke joke;
  DeviceDetail({Key key, this.deviceType, this.joke}): super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      children: [
        Text(joke?.setup ?? "Not selected yet", style: TextStyle(fontSize: 25),),
        Text(joke?.punchline ?? "Not yet selected", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
      ],    
    );

    if(deviceType == true){
      return Center(child: content,);
    }else{
      return Scaffold(
        appBar: AppBar(title: Text(joke?.type ?? "Not selected yet"),),
        body: Center(child: content,),
        backgroundColor: Colors.yellow,
      );
    }
  }

  
}