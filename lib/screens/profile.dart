import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  //TODO; profile Screen remaining
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Color(0xffF3B8B8),
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('Megan Fox'),
                background: Image.network(
                  'https://i.pinimg.com/564x/07/5a/e6/075ae61a854542148c9b0098e69a3ac7.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            Container(
              height: 200,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
