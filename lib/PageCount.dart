import 'package:flutter/material.dart';
import 'dart:math';

class PageCount extends StatelessWidget {
  PageCount({this.counter});

  final int counter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        double width2 = MediaQuery.of(context).size.width / 2.0;
        double x = details.globalPosition.dx;
        print('$x = $width2');
        NavigatorState nav = Navigator.of(context);
        if (x < width2) {
          if (nav.canPop()) nav.pop();
        } else if (counter < 20) {
          nav.push(_createRoute('left', this.counter + 1));
        }
      },
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Container(
              color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(1),
            ),
          ),
          Center(
              child: Container(
            color: const Color(0xffffffff),
            height: 146.0,
          )),
          Column(
            children: <Widget>[
              Expanded(child: Container()),
              Container(
                  height: 80,
                  child: Text('PageCount',
                      style: Theme.of(context).textTheme.headline1)),
              Container(
                  height: 30,
                  child: Text(
                    '#$counter',
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
              Expanded(child: Container()),
            ],
          )
        ],
      ),
    );
  }
}

int counter = 0;

Route _createRoute(String direction, int counter) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return PageCount(
        counter: counter,
      );
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var x = direction == 'left' ? 1.0 : -1.0;
      var begin = Offset(x, 0.0);

      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
