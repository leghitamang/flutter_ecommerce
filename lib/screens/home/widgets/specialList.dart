import 'package:flutter/material.dart';

class SpecialList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      padding: EdgeInsets.only(left: 20, top: 5, bottom: 10),
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 10),
            height: 90,
            width: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffFFC79D),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://image.freepik.com/free-vector/realistic-cosmetic-products-sale-advertisement_23-2148231284.jpg'),
              ),
            ),
          );
        },
      ),
    ));
  }
}
