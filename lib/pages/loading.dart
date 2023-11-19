import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({super.key});
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // void getData() async {
  //
  //   Response response = await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  //   // print(response.body);
  //   Map data = jsonDecode(response.body);
  //   print(data);
  //   print(data['title']);
  // }

  // late String time = 'laoding';

  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Cairo', flag: 'germany.png', url:'Africa/Cairo');
    await instance.getTime();
    // print(instance.time);
    // setState(() {
    //   time = instance.time;
    // });
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,

    });
  }

  @override
  void initState() {
    super.initState();
    // getData();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}











//explain async
// void getData() async{
//   // simulate network request for a username
//   String username = await Future.delayed(Duration(seconds: 3), (){
//     return 'jack';
//   });
//
//   // simulate network request to get bio of username
//   String bio = await Future.delayed(Duration(seconds: 2), (){
//     return 'vegan, musician';
//   });
//
//   print('$username - $bio');
//
// }
//
//
// @override
// int counter = 0;
//
// void initState() {
//   super.initState();
//   print('initState function run');
//   getData();
// }