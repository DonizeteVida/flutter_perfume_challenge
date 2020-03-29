import "package:flutter/material.dart";
import "dart:math" as math;

class HorizontalCategories extends StatelessWidget {
  const HorizontalCategories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      height: 60,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          if (index == 0) {
            return ConfigIcon();
          }
          return HorizontalCategoryIcon(index: index);
        },
      ),
    );
  }
}

class HorizontalCategoryIcon extends StatelessWidget {
  final int index;

  const HorizontalCategoryIcon({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      padding: const EdgeInsets.all(20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        "Category: $index",
        style: TextStyle(
          color: Colors.green,
        ),
      ),
    );
  }
}

class ConfigIcon extends StatelessWidget {
  const ConfigIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      margin: const EdgeInsets.only(
        right: 10,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green,
      ),
      padding: const EdgeInsets.all(20),
      child: Transform.rotate(
        angle: (1 + 1 / 2) * math.pi,
        child: Icon(
          Icons.tune,
          color: Colors.white,
        ),
      ),
    );
  }
}
