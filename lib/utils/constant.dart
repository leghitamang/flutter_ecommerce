import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Email',
  prefixIcon: Icon(Icons.people),
  hintStyle: TextStyle(fontWeight: FontWeight.w600),
  contentPadding: EdgeInsets.all(15),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  fillColor: Colors.white,
  filled: true,
  errorStyle: TextStyle(color: Colors.black),
);
