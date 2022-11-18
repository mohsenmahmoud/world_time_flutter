import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../service/world_time.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _HomeState();
}

class _HomeState extends State<Loading> {
  void setUpWorldTime() async {
    worldTime instance =
        worldTime(location: 'Cairo', flag: 'cairo.png', url: 'Africa/Cairo');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
          child: SpinKitFoldingCube(
            color: Colors.white,
            size: 120.0,
          ),
        ));
  }
}
