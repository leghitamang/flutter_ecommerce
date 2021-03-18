import 'package:flutter/material.dart';

class CategotyAppbar extends StatelessWidget {
  final String title;
  CategotyAppbar({@required this.title});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(Icons.filter_alt_rounded),
          onPressed: () {},
        ),
      ],
    );
  }
}
