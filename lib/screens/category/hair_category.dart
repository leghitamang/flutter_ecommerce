import 'package:flutter/material.dart';
import 'package:thai_products/screens/category/components/category_appbar.dart';

class HairCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
      slivers: [
        CategotyAppbar(title: 'Hair'),
      ],
      ),
    );
  }
}