import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Top Lakes'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/source.jpg',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            createTitleSection(),
            createButtonSection(context),
            createTextSection()
          ],
        ),
      ),
    );
  }
}

/*
  title section
 */
Widget createTitleSection() {
  return Container(
    padding: const EdgeInsets.all(32.0),
    child: new Row(
      children: [
        new Expanded(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  'Oeschinen Lake Campground',
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new Text(
                'Kandersteg, Switzerland',
                style: new TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        new Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        new Text('41'),
      ],
    ),
  );
}

/*
  button section
 */

Widget createButtonSection(BuildContext context) {
  return Container(
      child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
      buildButtonColumn(Icons.call, 'CALL', context),
  buildButtonColumn(Icons.near_me, 'ROUTE', context),
  buildButtonColumn(Icons.share, 'SHARE', context),
  ],
  ));
}

/*
  button item
 */
Column buildButtonColumn(IconData icon, String label, BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

/*
   text section
 */
Widget createTextSection() {
  return Container(
      padding: const EdgeInsets.all(32.0),
  child: Text(
  '''
長いテキストああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ     ''',
  softWrap: true,
  )
  );
}
