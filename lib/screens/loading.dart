import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.amber,
          )
        ),
      ),
    );
  }
}
