import 'package:flutter/material.dart';
import 'dart:math' as math;

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key key}) : super(key: key);

  int randomStar() {
    return math.Random().nextInt(5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.greenAccent,
              Colors.green,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 250,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height - 250,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          "assets/images/perfume.png",
                          height: 350,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(40),
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Kayali Elixir",
                        style: TextStyle(
                          fontSize: 36,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Text(
                        "Huda Beauty".toUpperCase(),
                        style: TextStyle(
                          color: Colors.black26,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "R\$ 99,99",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "48 reviews",
                                style: TextStyle(
                                  color: Colors.black26,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              _StarsCount(
                                starCount: randomStar(),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StarsCount extends StatelessWidget {
  final int starCount;

  const _StarsCount({Key key, this.starCount}) : super(key: key);

  List<Widget> _buildStars() {
    return List.generate(5, (index) {
      if (index < starCount) {
        return Icon(
          Icons.star,
          color: Colors.yellow,
        );
      }

      return Icon(
        Icons.star,
        color: Colors.grey,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _buildStars(),
    );
  }
}

class ShadowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final path = Path();
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width * 1/8, size.height * .75, size.width / 2, size.height / 2);
    path.quadraticBezierTo(size.width * 7/8, size.height * .25, size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
