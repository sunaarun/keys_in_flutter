import 'package:flutter/material.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({Key? key}) : super(key: key);

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final myKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const  Text("Globle Key Example"),),
      body:Form(
          key: myKey,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
           children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Name'
              ),
              validator: (val){
                if(val!.length! >3) {
                  return null;
                }
                else
                  {
                    return "enter valid lenght";
                  }
              },

            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Phone'),
              validator: (phone){
                if(phone!.isEmpty) return ' must enter phone';
                else return null;
              },
            ),
            TextButton(onPressed: (){
             if( myKey.currentState!.validate()) {
               Navigator.push(context, MaterialPageRoute(builder: (context) {
                       return Scaffold(appBar: AppBar(title: Text("new Page"),),
                       body: Center(child:Text("We are in new Page "
                           "${myKey.currentState!.runtimeType}",style: TextStyle(fontSize: 20),)),);
               }));
             }
             else {

             }
            }, child: Text("log In"))
          ],
      )
      ) ,
    );
  }

}
