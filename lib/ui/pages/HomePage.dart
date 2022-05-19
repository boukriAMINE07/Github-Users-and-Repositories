import 'package:flutter/material.dart';

import '../widgets/MyDrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Text('Hello Boukri Amine !',style: TextStyle(color: Colors.blue,fontSize: 33),),
      ),
    );
  }
}