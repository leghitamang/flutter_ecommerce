import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thai_products/models/user.dart';
import 'package:thai_products/screens/cartS.dart';
import 'package:thai_products/screens/profile.dart';
import 'package:thai_products/utils/auth_services.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        Consumer<User>(builder: (context, user, builder) {
          var userDetails = user.getUser();
          return UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              // child: Text('S'),
              backgroundImage: NetworkImage(userDetails.pp),
              radius: 20,
            ),
            accountName: Text(userDetails.name),
            accountEmail: Text(userDetails.email),
            decoration: BoxDecoration(color: Color(0xffF3B8B8)),
          );
        }),
        InkWell(
          child: ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
          ),
          onTap: () {},
        ),
        InkWell(
          child: ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.supervised_user_circle),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage()));
          },
        ),
        InkWell(
          child: ListTile(
            title: Text('History'),
            leading: Icon(Icons.home),
          ),
          onTap: () {},
        ),
        InkWell(
            child: ListTile(
          title: Text('WishList'),
          leading: Icon(Icons.favorite),
        )),
        InkWell(
          child: ListTile(
            title: Text('Cart'),
            leading: Icon(Icons.shopping_cart),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()));
          },
        ),
        Divider(),
        InkWell(
          child: ListTile(
            title: Text('About'),
            leading: Icon(Icons.info_rounded),
          ),
          onTap: () {},
        ),
        InkWell(
          child: ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.logout),
          ),
          onTap: () async {
            bool res = await AuthProvider().logOut();
            if (!res) {
              print('Error Logging Out');
            }
          },
        ),
      ],
    ));
  }
}
