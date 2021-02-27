import 'package:flutter/material.dart';

class gridData extends StatefulWidget {
  gridData({Key key}) : super(key: key);

  @override
  _gridDataState createState() => _gridDataState();
}

class _gridDataState extends State<gridData> {
  List<int> data = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    234,
    14,
    12,
    24124,
    13,
    13,
    1,
    12142,
    1
  ];

  Widget gridItem(int index) {
    return Container(
      height: 110,
      width: 110,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.pink,
          Colors.blue,
          Colors.purpleAccent,
          Colors.pink
        ]),
      ),
      child: Text('$index'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View'),
      ),
      body: GridView.builder(
          itemCount: data.length,
          padding: EdgeInsets.only(left: 10, right: 10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 40, mainAxisSpacing: 50),
          itemBuilder: (BuildContext context, int index) {
            return gridItem(index);
          }),
    );
  }
}
