import "package:flutter/material.dart";
import 'package:flutter_challenge/features/home/presentation/widgets/best_deals.dart';
import 'package:flutter_challenge/features/home/presentation/widgets/horizontal_categories.dart';
import 'package:flutter_challenge/features/home/presentation/widgets/product.dart';

class Home extends StatelessWidget {
  Widget _perfumeTitle() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        "Perfume",
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.short_text,
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _perfumeTitle(),
                HorizontalCategories(),
                ProductsList(),
                BestDealsRow(),
                BestDealsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
