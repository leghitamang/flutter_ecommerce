import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:thai_products/models/cart.dart';
import 'package:thai_products/screens/cartS.dart';
import 'package:thai_products/screens/home/widgets/categoryBox.dart';
import 'package:thai_products/screens/home/widgets/drawer.dart';
import 'package:thai_products/screens/home/widgets/popularList.dart';
import 'package:thai_products/screens/home/widgets/specialList.dart';

//#FFAB97
//#FFC79D
//#F3B8B8
//#F6A829
//#FFFFFF

class HomePage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            _appBarWithSearch(),
            _heading(
              title: 'Categories',
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),
            CategoryBox(),
            _heading(
              title: 'Special Offers',
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          SpecialList(),
            _popularListHeading(),
            PopularList(),
          ],
        ),
      ),
      floatingActionButton: _cartFloatingButton(),
    );
  }

  Widget _heading({String title, EdgeInsetsGeometry padding}) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: padding,
        child: Text(title),
      ),
    );
  }

  Widget _appBarWithSearch() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Material(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1.0),
          ),
          child: Container(
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Color(0xffF3B8B8),
                    ),
                    onPressed: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Color(0xffF3B8B8),
                    ),
                    onPressed: () {
                      print("your menu action here");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _popularListHeading() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Popular Now'),
            InkWell(
              child: Container(
                padding: EdgeInsets.all(4),
                child: Text(
                  'View All',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget _cartFloatingButton() {
    return Consumer<Cart>(
      builder: (context, cart, child) => Stack(
        alignment: Alignment.topRight,
        children: [
          FloatingActionButton(
            backgroundColor: Color(0xffF3B8B8),
            child: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 10,
            child: Text(cart.getCartLen().toString()),
          )
        ],
      ),
    );
  }
}
