import "package:flutter/material.dart";

class VerticalCategoryIcon extends StatelessWidget {
  final bool isSelected;
  final int index;
  final Function(int) onSelected;

  const VerticalCategoryIcon(
      {Key key, this.isSelected, this.index, this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(index),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotatedBox(
              child: Text(
                "Category: ${index + 1}".toUpperCase(),
                style: TextStyle(
                  color:
                      isSelected ? Colors.green : Colors.grey.withOpacity(.5),
                ),
              ),
              quarterTurns: 3,
            ),
            isSelected
                ? Container(
                    margin: const EdgeInsets.only(
                      left: 5,
                    ),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                  )
                : Container(
                    width: 10,
                    height: 10,
                  ),
          ],
        ),
      ),
    );
  }
}

class VerticalCategories extends StatefulWidget {
  VerticalCategories({Key key}) : super(key: key);

  @override
  _VerticalCategoriesState createState() => _VerticalCategoriesState();
}

class _VerticalCategoriesState extends State<VerticalCategories> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 75,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemBuilder: (_, index) {
          return VerticalCategoryIcon(
            index: index,
            isSelected: index == selectedIndex,
            onSelected: (selectedIndex) {
              setState(() {
                this.selectedIndex = selectedIndex;
              });
            },
          );
        },
      ),
    );
  }
}