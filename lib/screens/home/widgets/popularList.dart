import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thai_products/models/cart.dart';
import 'package:thai_products/models/products.dart';
import 'package:thai_products/screens/productInfo.dart';

class PopularList extends StatelessWidget {
  final List<Product> popularProducts = [
    Product(
      id: 'P1',
      name: 'Glutathione',
      price: '4000',
      category: 'Body',
      image: 'assets/images/products/glutathione.jpg',
    ),
    Product(
      id: 'P2',
      name: 'Legano',
      price: '3000',
      category: 'Hair',
      image: 'assets/images/products/legano.jpg',
    ),
    Product(
      id: 'P3',
      name: 'Colly',
      price: '2000',
      category: 'MakeUp',
      image: 'assets/images/products/colly.png',
    ),
    Product(
      id: 'P4',
      name: 'Spasmooth',
      price: '1500',
      category: 'Skin',
      image: 'assets/images/products/spasmooth.jpg',
    ),
    Product(
      id: 'P5',
      name: 'Wrinkless',
      price: '1000',
      category: 'Skin',
      image: 'assets/images/products/aunty.jpg',
    ),
    Product(
      id: 'P6',
      name: 'Neutrogena',
      price: '900',
      category: 'Hair',
      image: 'assets/images/products/neutrogena.jpg',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    final double itemWidth = size.width / 2;
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductInfoPage(
                          popularProducts[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Center(
                                child:
                                    Image.asset(popularProducts[index].image)),
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rs. ${popularProducts[index].price}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(popularProducts[index].name),
                                Text(
                                  popularProducts[index].category,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                ),
              );
            },
            childCount: popularProducts.length,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: (itemWidth / itemHeight),
          ),
        );
      },
    );
  }
}
