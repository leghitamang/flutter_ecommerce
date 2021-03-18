import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thai_products/models/cart.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: _appBar(context),
      body: cart.getCartLen() == 0
          ? Center(child: Text('No items in the cart.'))
          : _cartList(),
      bottomNavigationBar: cart.getCartLen() == 0 ? null : _bottomBar(),
    );
  }

  Widget _appBar(context) {
    return AppBar(
      centerTitle: true,
      title: Text('Shopping Cart', style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        color: Colors.black,
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _cartList() {
    return Consumer<Cart>(
      builder: (context, cart, child) => Container(
        padding: EdgeInsets.only(top: 20, left: 10, right: 10),
        child: ListView.builder(
          itemCount: cart.getCartLen(),
          itemBuilder: (context, index) {
            return Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage(cart.getCartItems()[index].image),
                            // backgroundColor: Colors.amber,
                            radius: 24,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cart.getCartItems()[index].name,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              Text('Quantity  1')
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            child:
                                Text('Rs.${cart.getCartItems()[index].price}'),
                          )),
                    ],
                  ),
                ),
                GestureDetector(
                  child: Icon(
                    Icons.cancel,
                    size: 30,
                    color: Color(0xffF3B8B8),
                  ),
                  onTap: () {
                    var product = cart.getCartItems()[index];
                    cart.remove(product);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _bottomBar() {
    return Consumer<Cart>(
      builder: (context, cart, child) => BottomAppBar(
        child: Container(
          padding: EdgeInsets.all(20),
          height: 150,
          // color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Order Total',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  Text('Rs.${cart.getTotalPrice().toString()}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
                ],
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: double.infinity,
                child: Text('Continue',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                decoration: BoxDecoration(
                  color: Color(0xffF3B8B8),
                  borderRadius: BorderRadius.circular(20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
