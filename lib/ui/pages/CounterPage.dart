import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {


  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conuter '),),
      body: Center(
        child: Text('Counter value $counter ',
        style: TextStyle(fontSize: 22),),
        
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                ++counter;
              });
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 8,),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                --counter;
              });
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
