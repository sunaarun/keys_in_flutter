import 'dart:math';

import 'package:flutter/material.dart';
import 'package:keys_in_flutter/student_class.dart';

class LocalKeyPage extends StatefulWidget {
  const LocalKeyPage({Key? key}) : super(key: key);

  @override
  State<LocalKeyPage> createState() => _LocalKeyPageState();
}

class _LocalKeyPageState extends State<LocalKeyPage> {
  List<Widget> myWidget=[
             const Text('First', key: ValueKey(1),),
            const Text("Second", key: ValueKey(2),),
            const Text("Third", key: ValueKey(3),),
            const Text("Fourth", key: ValueKey(2),),
  ];
  List<Student> studentList= [Student(s_id: 1, s_naem: "Ahmed", avg: 78.9),
    Student(s_id: 2, s_naem: "Ali", avg: 78.9),
    Student(s_id: 3, s_naem: "Mohammed", avg: 89.9),
  ];

 late List<StudentClass> students;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    students= [
  StudentClass(student:studentList[0], color: Colors.lime,
  key: ObjectKey(studentList[0]),),
  StudentClass(student:  studentList[1], color: Colors.purple.shade300, key: ObjectKey(studentList[1]),),
  StudentClass(student: studentList[2], color: Colors.pink.shade300, key: ObjectKey(studentList[2]),),
      StudentClass(student: studentList[2], color: Colors.pink.shade300, key: ObjectKey(studentList[2]),)
  ];

  }  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Local Key Example"),),
      body: Column(
        //Step #1
        // children: [
        //   Text("One", key: ValueKey(1),),
        //   Text("Two", key: ValueKey(2),),
        //   Text("Three", key: ValueKey(1),)
        // ],
 
        //TODO the second Step
      //   children: myWidget.map((e) {
      //     //Step #2
      //      if( e.key== ValueKey(2))
      //      { return Container(child: e, color: Colors.purple[300], width: 150,height: 50,);}
      //     return  Container(child: e,margin: EdgeInsets.all(10), color: Colors.amber,width: 200,height: 100,);
      //   }).toList(),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     setState(() {
      //       myWidget.removeWhere((element)
      //
      //     {return element.key == ValueKey(2);});
      //     });
      //   },
      //   child: Icon(Icons.delete_forever),
      // ),
    children: students
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            students.insert(0,students.removeAt(2));
          });
        },
        child: Icon(Icons.swap_calls),
      ),
    );

  }
}

class StudentClass extends StatelessWidget {
   StudentClass({required this.key, required this.student, required this.color}) : super(key: key);
  Student student;
  Color color;
  Key key;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,//Colors.primaries[Random().nextInt(Colors.primaries.length)],
      child: ListTile(
        title: Text("${student.s_naem}"),
        subtitle: Text("${student.s_id}   : AVG = ${student.avg}"),
      ),
    );
  }
}
