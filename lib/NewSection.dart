import 'package:flutter/material.dart';
import 'package:projects/ListItem.dart';

class NewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
        color: Colors.blueGrey,
        width: 300.0,
        padding: const EdgeInsets.all(32.0),
        child:
        Center(
            child: Column(
              children: <Widget>[
                createColumn(context, 1),
                createColumn(context, 2),
                createColumn(context, 3),
                createColumn(context, 4),
                createColumn(context, 5),
              ],
            )
        )
    );
  }

  Widget createColumn(BuildContext context, int index) {
    return InkWell(
        onTap: () {
          print('click tapped!');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListItem(index)),
          );
        },
      child: Center(
        child: Container(
          color: Colors.blue[800],
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(8.0),
          child: Text('jump to item $index'),
        ),
      ),
    );
  }

}