import 'package:flutter/material.dart';
import 'package:worled_time/pages/loading.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;

    print(data);

    //set background
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100.0, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                  onPressed: (() async {
                    dynamic result =
                        await Navigator.of(context).pushNamed('/location');

                    setState(() {
                      data = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isDayTime': result['isDayTime']
                      };
                    });
                  }),
                  icon: Icon(
                    Icons.location_on_rounded,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                    'chooose location',
                    style: TextStyle(color: Colors.grey[300]),
                  )),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 60.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
