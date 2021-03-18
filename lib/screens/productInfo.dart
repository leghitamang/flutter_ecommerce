import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thai_products/models/cart.dart';
import 'package:thai_products/models/products.dart';
import 'package:thai_products/screens/cartS.dart';

class ProductInfoPage extends StatefulWidget {
  final Product product;
  ProductInfoPage(this.product);

  @override
  _ProductInfoPageState createState() => _ProductInfoPageState();
}

class _ProductInfoPageState extends State<ProductInfoPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, builder) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          appBar: _buildAppBar(),
          body: _buildBody(),
          bottomNavigationBar: _buildBottomBar(),
        );
      },
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        width: double.infinity,
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //TODO: Interactive viewer to interact the user with product image.
            Center(
              child: Image.asset(
                widget.product.image,
                height: 250,
                width: 250,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.product.name,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text('Thailand Products'),
            SizedBox(height: 5),
            Text(widget.product.category, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 10),
            Text('200g', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Rs.${widget.product.price}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
                _buildQuantityButton(),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vestibulum interdum ipsum. Duis consequat aliquet cursus. Pellentesque non lacus libero. Donec tempus tellus dolor, vitae commodo mi gravida et. Nunc consectetur sed arcu at tincidunt. Suspendisse potenti. Suspendisse id scelerisque elit, a pharetra nunc. In hac habitasse platea dictumst. Sed nec neque nibh. Curabitur a ex ac velit convallis accumsan et non mi. Donec velit arcu, sagittis nec mi nec, ultrices convallis odio. In justo massa, molestie ut vestibulum ut, interdum eget massa. Donec quis odio nec lectus suscipit ornare. Phasellus odio tortor, imperdiet vitae pellentesque elementum, imperdiet et enim. Quisque augue nunc, luctus eu pellentesque eu, volutpat nec odio.'),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // color: Colors.amber,
        height: 100,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: _buildLikeButton(),
            ),
            Expanded(
              flex: 3,
              child: _buildAddToCartButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityButton() {
    return Container(
      width: 150,
      height: 50,
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xffF3B8B8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            child: Icon(Icons.remove),
            onTap: () {
              setState(() {
                if (quantity > 1) {
                  quantity -= 1;
                }
              });
            },
          ),
          Text(quantity.toString(), style: TextStyle(fontSize: 18)),
          InkWell(
            child: Icon(Icons.add),
            onTap: () {
              setState(() {
                quantity += 1;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget dialog() {
    return AlertDialog(
      title: Text('Added Successfully'),
      content: Text('Your product is added successfully'),
      actions: [],
    );
  }

  Widget _buildAddToCartButton() {
    return Consumer<Cart>(
      builder: (context, cart, child) => GestureDetector(
        child: Container(
          height: 60,
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Color(0xffF3B8B8),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            'Add to Cart',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        onTap: () {
          if (cart.add(widget.product)) {
            final snackBar = SnackBar(
              content: Text('Item added to cart.'),
              action: SnackBarAction(
                label: 'Checkout',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CartPage()));
                },
              ),
            );
            _scaffoldKey.currentState.showSnackBar(snackBar);
          } else {
            final snackBar = SnackBar(
              content: Text('Item already added to cart'),
            );
            _scaffoldKey.currentState.showSnackBar(snackBar);
          }
        },
      ),
    );
  }

  Widget _buildLikeButton() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(5)),
            child: Icon(Icons.favorite, size: 18, color: Colors.amber),
          ),
          Text('490'),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        color: Colors.black,
        iconSize: 20,
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                color: Color(0xffF3B8B8),
                iconSize: 26,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartPage(),
                    ),
                  );
                },
              ),
              Consumer<Cart>(
                builder: (context, cart, child) => CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 10,
                  child: Text(cart.getCartLen().toString()),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
