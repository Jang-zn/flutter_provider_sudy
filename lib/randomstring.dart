import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

void main()=>runApp(randomName());

class randomName extends StatelessWidget {
  const randomName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home : DemoPage(),
    );
  }
}


class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    int number =25;
    return Scaffold(
        backgroundColor:Colors.blueGrey,
        appBar: AppBar(
        title:Text("Demo Random String"),
      ),
      body:Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color:Colors.grey.shade200,
        ),
        child:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text(randomNumeric(10),style : const TextStyle(fontSize: 20)),
              Text(randomBetween(10, 100).toString(), style: const TextStyle(fontSize: 20)),
              Text("this is constant $number Number",style: const TextStyle(fontSize: 20)),
              Text(randomString(20),style: const TextStyle(fontSize: 20)),
              Text(randomAlphaNumeric(8),style: const TextStyle(fontSize: 20)),
              Text(randomMerge("hello", "friends"),style: const TextStyle(fontSize: 20)),


            ]
          )
        )
      )
    );
  }
}
