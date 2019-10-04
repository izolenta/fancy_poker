import 'package:flutter/widgets.dart';

class GridWidget extends StatefulWidget {
  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget>{

  final children = <Widget>[
        Image.asset('assets/images/1.png'),
        Image.asset('assets/images/2.png'),
        Image.asset('assets/images/3.png'),
        Image.asset('assets/images/5.png'),
        Image.asset('assets/images/8.png'),
        Image.asset('assets/images/13.png'),
        Image.asset('assets/images/21.png'),
        Image.asset('assets/images/40.png'),
        Image.asset('assets/images/100.png'),
        Image.asset('assets/images/break.png'),
        Image.asset('assets/images/unclear.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      gridDelegate:new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 5,
        childAspectRatio: 0.8,
      ),
      children: children,
    );
  }
}