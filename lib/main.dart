import "package:flutter/material.dart";
import 'package:flutter_challenge/features/home/presentation/screen/home.dart';
import 'package:flutter_challenge/features/home/presentation/screen/product_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: "/",
      onGenerateRoute: Router.onGenerateRouter,
    );
  }
}

class Router {
  static Route<dynamic> onGenerateRouter(RouteSettings settings) {
    
    final transition = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          _routes[settings.name],
      transitionsBuilder: (ctx, anim1, anim2, child) {

        final animation =
            Tween<Offset>(begin: Offset(1, 0), end: Offset.zero).animate(
          anim1,
        );

        return SlideTransition(
          position: animation,
          child: child,
        );
      },
    );

    return transition;
  }

  static var _routes = {
    "/": Home(),
    "productDetail": ProductDetail(),
  };
}
