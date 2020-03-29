import 'package:flutter/material.dart';

class BestDealsRow extends StatelessWidget {
  const BestDealsRow({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Best deals",
            style: TextStyle(
              fontSize: 26,
            ),
          ),
          _BestDealsIcon(),
        ],
      ),
    );
  }
}

class _BestDealsIcon extends StatelessWidget {
  const _BestDealsIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "ALL",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 10,
            ),
            width: 25,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BestDealsList extends StatelessWidget {
  const BestDealsList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: const EdgeInsets.only(
        top: 10,
      ),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return _BestDealsListItem();
        },
      ),
    );
  }
}

class _BestDealsListItem extends StatelessWidget {
  const _BestDealsListItem({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(.3),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      width: MediaQuery.of(context).size.width * .7,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [
                          Colors.greenAccent,
                          Colors.green,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
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
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 50,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(18),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                "-20%",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
