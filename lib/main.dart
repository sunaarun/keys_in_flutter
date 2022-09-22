
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:keys_in_flutter/local_keys.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:   //LocalKeyPage()
      HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> myContainers = [
    Padding( // Use key at the top level
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: GetContainer(color: Colors.yellow,name:  "Sanaa",),
    ),
    Padding( // Use kay at the top level
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: GetContainer(color: Colors.green, name: "Zahra",),
    ),
  ];

  swapContainers() {
    setState(() {
      myContainers.insert(1, myContainers.removeAt(0));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: myContainers,
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: swapContainers,
                child:const Text("Swap"),
              )
            ],
          ),
        ));
  }
}
// class GetContainer extends StatelessWidget {
//   GetContainer({required this.color});
//   Color color;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color:color ,
//       width: 50,
//       height: 50,
//     );
//   }
// }

class GetContainer extends StatefulWidget {

  GetContainer({required this.color, required this.name});
  Color color;
 // Key key;
  String name;
  @override
  _GetContainerState createState() => _GetContainerState();
}
class _GetContainerState extends State<GetContainer> {
  late Color color;
  late String name;
  @override
  void initState() {
    super.initState();
    color = widget.color;
    name =widget.name;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 50,
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)] , // to Generate a Random color for the Container
      child: Text(name, style: TextStyle(fontSize: 17, color: Colors.white),),
    );
  }
}


