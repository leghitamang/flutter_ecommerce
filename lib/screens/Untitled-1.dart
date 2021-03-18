import 'package:flutter/material.dart';

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
      floatingActionButton: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          FloatingActionButton(
              mini: true,
              child: Icon(
                Icons.shopping_cart,
                size: 22,
              ),
              backgroundColor: Color(0xffF3B8B8),
              onPressed: () {}),
          CircleAvatar(
            radius: 10,
            backgroundColor: Color(0xffFFAB97),
            child:
                Text('1', style: TextStyle(color: Colors.white, fontSize: 10)),
          )
        ],
      ),
      drawer: Drawer(),
      key: _scaffoldKey,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(),
              width: MediaQuery.of(context).size.width,
              height: 160.0,
            ),
            Positioned(
              top: 40.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Material(
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
                                  color: Colors.red,
                                ),
                                onPressed: () {
                                  print("your menu action here");
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
                                  color: Colors.red,
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
                    SizedBox(height: 20),
                    Text('Category', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 10),
                    Material(
                        elevation: 2,
                        child: Container(
                          height: 50,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.people,
                                        color: Color(0xffFFAB97),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Makeup',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      )),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.people,
                                        color: Color(0xffFFAB97),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Makeup',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      )),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.people,
                                        color: Color(0xffFFAB97),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Makeup',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      )),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.people,
                                        color: Color(0xffFFAB97),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Makeup',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: 20),
                    Text('Special Offers'),
                    Container(
                      height: 100,
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 5),
                            height: 80,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffFFC79D),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://image.freepik.com/free-vector/realistic-cosmetic-products-sale-advertisement_23-2148231284.jpg'))),
                          );
                        },
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text('Popular Now'),
                    SizedBox(height: 10),
                    Container(
                        height: 300,
                        decoration: BoxDecoration(),
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                // height: 0,
                                child: Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            'https://i.pinimg.com/originals/66/e7/5c/66e75c59b9b272329203a65ad7b2a8bc.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
