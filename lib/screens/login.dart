import 'package:flutter/material.dart';
import 'package:thai_products/components/custom_button.dart';
// import 'package:thai_products/screens/home/home.dart';
import 'package:thai_products/utils/auth_services.dart';
import 'package:thai_products/utils/constant.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool loginError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      //TODO: Error Overflow on landscape
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text('Thai Products Nepal', style: TextStyle(fontSize: 22)),
            SizedBox(height: 40),
            _emailTextField(),
            SizedBox(height: 20),
            _passwordTextField(),
            SizedBox(height: 20),
            _forgotPassword(),
            SizedBox(height: 40),
            CustomButton(title: 'Login', onTap: login),
            SizedBox(height: 20),
            _registerText(),
            SizedBox(height: 20),
            _divider(),
            SizedBox(height: 10),
            _socialSignIn(),
          ],
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: kTextFieldDecoration.copyWith(
        hintText: 'Email',
      ),
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      controller: _passwordController,
      decoration: kTextFieldDecoration.copyWith(
          hintText: 'Password', prefixIcon: Icon(Icons.lock)),
    );
  }

  Widget _forgotPassword() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Text('Forgot Password?'),
    );
  }

  Widget _divider() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Divider(),
        Text('OR', style: TextStyle(fontSize: 18, color: Colors.grey)),
      ],
    );
  }

  Widget _socialSignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialIconButton(
          iconPath: 'assets/icons/fbIcon.png',
          onTap: () {},
        ),
        SizedBox(width: 30),
        _socialIconButton(
          iconPath: 'assets/icons/googleIcon.png',
          onTap: loginWithGoogle,
        ),
      ],
    );
  }

  Widget _socialIconButton({String iconPath, Function onTap}) {
    return GestureDetector(
      child: CircleAvatar(
        child: Image.asset(
          iconPath,
          height: 30,
          width: 30,
        ),
        backgroundColor: Colors.white,
      ),
      onTap: onTap,
    );
  }

  _registerText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?'),
        SizedBox(width: 5),
        GestureDetector(
          child: Text('Sign Up'),
          onTap: () {},
        )
      ],
    );
  }

  loginWithGoogle() async {
    bool res = await AuthProvider().signInWithGoogle();
    if (!res) {
      print('SignIn with google failed');
    }
  }

  Widget showAlert() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.error),
          ),
          Expanded(child: Text('Error Message')),
          IconButton(icon: Icon(Icons.close), onPressed: () {}),
        ],
      ),
    );
  }

  login() async {
    // Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()));
    print('Login Pressed');
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      print('Email or password cannot be empty.');
      return;
    }
    bool loginStatus = await AuthProvider()
        .signInWithEmail(_emailController.text, _passwordController.text);
    if (!loginStatus) {
      print('Login Failed');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
