import 'package:flutter/material.dart';
import 'package:projects/NewSection.dart';
import 'package:projects/MyColors.dart';
import 'package:projects/Login.dart';
import 'package:projects/API/APIMain.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final newThemeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.pink[200],
    accentColor: Colors.pink[900],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout Demo',
      theme: newThemeData,
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
            LoginSection(),
            APISection(),
            createTitleSection(),
            createButtonSection(context),
            createTextSection(),
            NewSection()
          ],
        ),
      ),
    );
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
            color: Colors.redAccent,
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: MyColors.baseColors['icon']),
        Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: MyColors.baseColors['button_text'],
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
          style: TextStyle(color: MyColors.baseColors['normal_text']),
        ));
  }
}

/*
 * Login section
 */
class LoginSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RaisedButton(
      padding: const EdgeInsets.all(8.0),
      elevation: 4.0,
      splashColor: Colors.blueGrey,
      onPressed: () {
          print('click tapped!');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignIn()),
          );
      },
      child: Text('login'),
    ),
        ));
  }
}

/*
 * Login section
 */
class APISection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RaisedButton(
            padding: const EdgeInsets.all(8.0),
            elevation: 4.0,
            splashColor: Colors.blueGrey,
            onPressed: () {
              print('click tapped!');
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => APIMain()),
              );
            },
            child: Text('API get Data'),
          ),
        ));
  }
}
