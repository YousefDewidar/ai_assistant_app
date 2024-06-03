import 'package:flutter/material.dart';

AppBar customAppBar({required String title}) {
  return AppBar(
    title:  Text(
      title,
      style:const TextStyle(
          color: Colors.deepPurple, fontSize: 20, fontWeight: FontWeight.w700),
    ),
    centerTitle: true,
    elevation: .9,
    shadowColor: Colors.grey,
    backgroundColor: Colors.white,
  );
}
