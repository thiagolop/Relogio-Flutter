import 'package:flutter/material.dart';

class DespertadorScreen extends StatefulWidget {

  const DespertadorScreen({ Key? key }) : super(key: key);

  @override
  State<DespertadorScreen> createState() => _DespertadorScreenState();
}

class _DespertadorScreenState extends State<DespertadorScreen> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Container(
             color: Colors.black,
           ),
       );
  }
}