import 'package:flutter/material.dart';

class GlobalParams{
  static List<Map<String,dynamic>> menus=[
    {
        "title":"Counter","icon":Icon(Icons.add,color: Colors.blue,),"route":"/counter"
    },
    {
      "title":"Users","icon":Icon(Icons.supervised_user_circle_sharp,color: Colors.blue,),"route":"/users"
    },
    {
      "title":"Meteo","icon":Icon(Icons.cloud_queue_sharp,color: Colors.blue,),"route":"/meteo"
    },
    {
      "title":"Gallery","icon":Icon(Icons.image_outlined,color: Colors.blue,),"route":"/gallery"
    }
  ];
}