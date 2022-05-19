import 'package:first_app_flutter/ui/pages/CounterPage.dart';
import 'package:first_app_flutter/ui/pages/GalleryPage.dart';
import 'package:first_app_flutter/ui/pages/MeteoPage.dart';
import 'package:first_app_flutter/ui/pages/UsersPage.dart';
import 'package:flutter/material.dart';

import 'ui/pages/HomePage.dart';

void main()=>  runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/home":(context) => HomePage(),
        "/meteo":(context) => MeteoPage(),
        "/gallery":(context) => GalleryPage(),
        "/counter":(context) => CounterPage(),
        "/users":(context)=>UsersPage()
      },
      initialRoute: "/home",
    );
  }
}



