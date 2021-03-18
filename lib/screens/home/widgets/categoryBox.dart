import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Material(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _categoryOption(
                  title: 'Hair',
                  img: 'assets/icons/catIcons/hair.png',
                  onTap: () {
                    Navigator.pushNamed(context, '/hairCategory');
                  },
                ),
                _categoryOption(
                  title: 'MakeUp',
                  img: 'assets/icons/catIcons/makeup.png',
                  onTap: () {
                    Navigator.pushNamed(context, '/hairCategory');
                  },
                ),
                _categoryOption(
                  title: 'Skin',
                  img: 'assets/icons/catIcons/skin.png',
                  onTap: () {
                    Navigator.pushNamed(context, '/hairCategory');
                  },
                ),
                _categoryOption(
                  title: 'Body',
                  img: 'assets/icons/catIcons/body.png',
                  onTap: () {
                    Navigator.pushNamed(context, '/hairCategory');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoryOption({String title, String img, Function onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Image.asset(
            img,
            height: 30,
            width: 30,
            color: Color(0xffF3B8B8),
          ),
          // Icon(Icons.people, size: 25, color: Color(0xffF3B8B8)),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
