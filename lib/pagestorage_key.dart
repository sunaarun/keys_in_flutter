import 'package:flutter/material.dart';
class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<Widget> myWidget= [PageOne(), PageTwo()];
  int index =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myWidget[index],
      bottomNavigationBar: BottomNavigationBar(
         items: [
           BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
           BottomNavigationBarItem(icon: Icon(Icons.star), label: "Page2")
         ],
        onTap: (newVal){
           setState(() {
              index =newVal;
           });
        },
      ),
    );
  }
}
class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Two"),),
      body: Center(child: Text("We are in Page Two"),),
    );
  }
}

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
       // key:PageStorageKey<String>("Sanaa"),
          itemCount: 100,
          itemBuilder: (context, index){
            return Padding(padding: EdgeInsets.all(10),
              child: Text("Item $index",style: TextStyle(fontSize: 20),),);
          }),
    );
  }
}
