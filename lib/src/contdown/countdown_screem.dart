import 'package:flutter/material.dart';

class CountdownScreem extends StatefulWidget {

  const CountdownScreem({ Key? key }) : super(key: key);

  @override
  State<CountdownScreem> createState() => _CountdownScreemState();
}

class _CountdownScreemState extends State<CountdownScreem> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Container(
            color: Colors.amber,
           ),
       );
  }
}