import 'package:flutter/material.dart';
import 'package:flutter_challenge/features/home/presentation/widgets/vertical_categories.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({Key key}) : super(key: key);

  _getContext(BuildContext context) {
    return (index) {
      Navigator.of(context).pushNamed("productDetail");
    };
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      height: 350,
      width: double.infinity,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          if (index == 0) {
            return VerticalCategories();
          }
          return ProductListItem(
            index: index - 1,
            onSelected: _getContext(context),
          );
        },
      ),
    );
  }
}

class ProductListItem extends StatelessWidget {
  final int index;
  final Function(int) onSelected;

  const ProductListItem({Key key, this.index, this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 5,
      child: GestureDetector(
        onTap: () => onSelected(index),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 8,
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.greenAccent,
                            Colors.green,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          child: Image.asset(
                            "assets/images/perfume.png",
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      height: 50,
                      width: 55,
                      right: 0,
                      top: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                          ),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.favorite,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Product title",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "R\$ 99.99",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
