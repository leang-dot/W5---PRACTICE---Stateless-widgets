import 'package:flutter/material.dart';

AppBar appBar(String title){
  return AppBar(
    backgroundColor: const Color.fromARGB(255, 55, 165, 255),
    title: Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    )
  );
}