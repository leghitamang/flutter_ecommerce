import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thai_products/models/cart.dart';
import 'package:thai_products/models/user.dart';
import 'package:thai_products/screens/cartS.dart';
import 'package:thai_products/screens/category/hair_category.dart';
import 'package:thai_products/screens/home/home.dart';
import 'package:thai_products/screens/login.dart';
import 'package:thai_products/screens/loading.dart';
import 'package:thai_products/screens/profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Cart>(
          create: (context) => Cart(),
        ),
        Provider(
          create: (context) => User(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Color(0xffF3B8B8),
          // brightness: Brightness.dark,
          fontFamily: 'Montserrat',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainScreen(),
        routes: appRoutes(),
      ),
    );
  }
}

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    '/home': (context) => HomePage(),
    'login': (context) => LoginPage(),
    'profile': (context) => ProfilePage(),
    'cart': (context) => CartPage(),
    '/hairCategory': (context) => HairCategoryPage(),
  };
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return LoadingPage();
        if (!snapshot.hasData || snapshot.data == null) return LoginPage();
        return HomePage();
      },
    );
  }
}
