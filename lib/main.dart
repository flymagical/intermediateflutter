import 'package:flutter/material.dart';
import 'package:intermedieteflutter/arguments/arg_adaptive.dart';
import 'package:intermedieteflutter/screens/adaptive.dart';
import 'package:intermedieteflutter/screens/device.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (settings){
        if(settings.name == DeviceDetail.screenId){
          AdaptiveArgument argument = settings.arguments;
          return MaterialPageRoute(builder: (context){
            return DeviceDetail(deviceType: argument.deviceType, joke: argument.joke);
          });
        }
      },
      initialRoute: Menu.screenId,
      routes: {
        Menu.screenId:(context)=> Menu(),
        Adaptive.screenId:(context)=> Adaptive(),
        Device.screenId: (context) => Device(),
        //DeviceDetail.screenId:(context)=> DeviceDetail(),

      },
    );
  }
}

class Menu extends StatelessWidget {
  static final String screenId = "menu";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu"),
      
      ),
      body: Column(children: [
        RaisedButton(onPressed: (){
           Navigator.pushNamed(context, Adaptive.screenId);
        },
          child: Text("Adaptive Layout"),
        )
      ],),
    );
  }
}