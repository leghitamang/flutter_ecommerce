import 'package:flutter/material.dart';
import 'package:thai_products/screens/home/home.dart';
import 'package:thai_products/utils/auth_services.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Firebase Authentication')),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 45,
                width: double.infinity,
                child: RaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/icons/googleIcon.png',
                          height: 40, width: 40),
                      Text('SignIn with Google'),
                    ],
                  ),
                  color: Colors.white,
                  textColor: Colors.green,
                  onPressed: () async {
                    bool res = await AuthProvider().signInWithGoogle();
                    if (!res) {
                      print('SignIn with google failed');
                    } else {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 45,
                width: double.infinity,
                child: RaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/icons/fbIcon.png',
                          height: 40, width: 40),
                      Text('SignIn with Facebook'),
                    ],
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 45,
                width: double.infinity,
                child: RaisedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.email,
                        size: 30,
                      ),
                      Text('SignIn with Email'),
                    ],
                  ),
                  color: Colors.purpleAccent,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              )
            ],
          )),
    );
  }
}
